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
		date = days.index(gets.chomp) + 1
		puts "What time will it take place?"
		hour = gets.chomp
		puts "Please enter a short description of the event."
		appointment = gets.chomp
		puts "Is this an important event?"
		alert = gets.chomp
		db.execute("INSERT INTO events (event, time, urgent, week_id) VALUES (?, ?, ?, ?)", [appointment, hour, alert, date])
	end
end

# allow the user to access all the events 
def access_events(db)
	puts "Would you like to view your calendar? (y/n)"
	if gets.chomp == 'y'
		plan = db.execute("SELECT week.day, events.time, events.event FROM week, events WHERE events.week_id = week.id")
		plan.each do |event|
			puts event.join('-')
		end
	end
end

# allow the user to delete events
def delete_event(db, days)
	puts "Would you like to delete an event? (y/n)"
	if gets.chomp == 'y'
		puts "What day is the event on?"
		day = gets.chomp
		index = days.index(day) + 1
		puts "Which event would you like to delete from #{day}?"
		deleted = gets.chomp
		db.execute("DELETE FROM events WHERE events.event = ? AND events.week_id = ?", [deleted, index])
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

# driver code
commands = {
	'list'=>'access a list of upcoming events',

}

puts "Welcome to your calendar."
puts "use one of the following commands or type 'done' when finished:"
generate_tables(days, db, add_events, add_week)
access_events(db)
new_event(db, days)
access_events(db)
delete_event(db, days)
# generate tables if you clear the calendar
clear_calendar(days, db, add_events, add_week)
reminder(db)

