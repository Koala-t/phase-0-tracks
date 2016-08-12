# I am going to make a functional calendar.
# It will let the user update and access data. 
# It will have some methods to print out events based on parameters.

# require gems
require 'sqlite3'

# create database
db = SQLite3::Database.new("calendar.db")

# make some tables (stick to weekly calendar for now)
add_week = <<-SQL 
	CREATE TABLE IF NOT EXISTS week(
		id INTEGER PRIMARY KEY,
		day VARCHAR(255)
	)
SQL

add_events = <<-EVENTS_TABLE 
	CREATE TABLE IF NOT EXISTS events(
		id INTEGER PRIMARY KEY,
		event VARCHAR(255),
		time TIME,
		urgent BOOLEAN,
		week_id INT,
		FOREIGN KEY (week_id) REFERENCES week(id)
	)
EVENTS_TABLE


def generate_tables(days, db, add_events, add_week)
	db.execute(add_events)
	db.execute(add_week)
	if db.execute("SELECT id FROM week") == []
		add_days(days, db)
	end
end

# make a days array
days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

# make a function to fill the week with days
def add_days(days, db)
	days.each do |d|
		db.execute("INSERT INTO week (day) VALUES (?)", [d])
	end
end

# prompt the user to add an event
def new_event(db, days)
	puts "Would you like to add an event to the calendar? (y/n)"
	if gets.chomp == 'y'
		puts "What day will the event take place?"
		day = gets.chomp
		# check if the input was valid
		if days.include?(day)
			date = days.index(day) + 1
			puts "What time will it take place?"
			hour = gets.chomp
			puts "Please enter a short description of the event."
			appointment = gets.chomp
			puts "Is this an important event?"
			alert = gets.chomp
			db.execute("INSERT INTO events (event, time, urgent, week_id) VALUES (?, ?, ?, ?)", [appointment, hour, alert, date])
		else
			puts "I do not recognise that day."
		end
	end
end

# allow the user to access all the events 
def access_events(db)
	puts "Would you like to view your calendar? (y/n)"
	if gets.chomp == 'y'
		plan = db.execute("SELECT week.day, events.time, events.event, week.id FROM week, events WHERE week.id = events.week_id")
		# until all the events are listed
		until plan == []
			next_event = plan.first
			# look for the next event
			plan.each do |event|
				if next_event.last > event.last
					next_event = event
				end
			end
			# remove next_event from plan
			plan.delete_at(plan.index(next_event))
			# remove the week.id from next_event
			next_event.pop
			# print the next_event
			puts next_event.join('-')
		end
	end
end

# allow user to see events on a particular day
def daily_events(db, days)
	puts "which day's events would you like to see?"
	day = gets.chomp
	# check for invalid input
	if days.include?(day)
		index = days.index(day) + 1
		plan = db.execute("SELECT events.time, events.event FROM events WHERE events.week_id = ?", [index])
		plan.each do |event|
			puts event.join('-')
		end
	else
		puts "I do not recognise that day"
	end
end

# allow the user to delete events
def delete_event(db, days)
	puts "Would you like to delete an event? (y/n)"
	if gets.chomp == 'y'
		puts "What day is the event on?"
		day = gets.chomp
		# check for invalid input
		if days.include?(day)
			index = days.index(day) + 1
			puts "Which event would you like to delete from #{day}?"
			deleted = gets.chomp
			db.execute("DELETE FROM events WHERE events.event = ? AND events.week_id = ?", [deleted, index])
		else
			puts "I do not recognise that day"
		end
	end
end

# remind the user of the important events
def reminder(db)
	puts '----------------------'
	puts "Dont forget to attend:"
	important = db.execute("SELECT week.day, events.time, events.event FROM week, events WHERE events.week_id = week.id AND events.urgent = 'true'")
	important.each do |event|
		puts '----------------------'
		puts event.join('-')
	end
	puts '----------------------'
end

# make a method to update the time of an event
def change_time(db, days)
	puts "Would you like to change the time of an event? (y/n)"
	if gets.chomp == 'y'
		puts "What day is the event on?"
		day = gets.chomp
		# check for invalid input
		if days.include?(day)
			index = days.index(day) + 1
			puts "What event would you like to change?"
			event = gets.chomp
			puts "When will it happen?"
			time = gets.chomp
			db.execute("UPDATE events SET time = ? WHERE event = ? AND week_id = ?", [time, event, index])
		else
			puts "I do not recognise that day"
		end
	end
end

# make something to clear the week and day
def clear_calendar(days, db, add_events, add_week)
	puts "Would you like to clear the calendar? (y/n)"
	if gets.chomp == 'y'
		puts "Are you sure you would like to clear the calendar? (y/n)"
		if gets.chomp == 'y'
			db.execute("DROP TABLE week")
			db.execute("DROP TABLE events")
			generate_tables(days, db, add_events, add_week)
		end
	end
end

# list the avaliable commands
describe_commands = {
	'list'=>'access a list of upcoming events',
	'day'=>'access all the events on a given day',
	'add'=>'add a new event to your calendar',
	'remove'=>'remove an item from the calendar',
	'change'=>'change the time of an event',
	'clear'=>'remove all items from the calendar'
}

def list_commands(describe_commands)
	describe_commands.each_key do |command|
		puts "#{command}: #{describe_commands[command]}"
	end
end
# driver code

# tell the user what they can do
puts "Welcome to your calendar."
puts "Enter 'help' for a list of available commands or 'done' when finished."

# make the tables (if they're not already there)
generate_tables(days, db, add_events, add_week)

# let the user select an action
action = ''
until action == 'done' do
	puts "What would you like to do?"
	action = gets.chomp
	case action
	when 'help'
		list_commands(describe_commands)
	when 'list'
		access_events(db)
	when 'day'
		daily_events(db, days)
	when 'add'
		new_event(db, days)
	when 'remove'
		delete_event(db, days)
	when 'change'
		change_time(db, days)
	when 'clear'
		clear_calendar(days, db, add_events, add_week)
	end
end

# remind the user of important events
reminder(db)