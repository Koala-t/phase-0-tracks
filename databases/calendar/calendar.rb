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

db.execute(add_events)
db.execute(add_week)


# make a function to fill the week with days
days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
def add_days(days, db)
	days.each do |d|
		db.execute("INSERT INTO week (day) VALUES (?)", [d])
	end
end

# add days to the week table if they're not already there 
if db.execute("SELECT id FROM week") == []
	add_days(days, db)
end

# prompt the user to add an event
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

# make something to clear the week and day
puts "Would you like to clear the calendar? (y/n)"
if gets.chomp == 'y'
	puts "Are you sure you would like to clear the calendar? (y/n)"
	if gets.chomp == 'y'
		db.execute("DROP TABLE week")
		db.execute("DROP TABLE events")
	end
end

# allow the user to access all the events 
puts "Would you like to view your calendar? (y/n)"
if gets.chomp == 'y'
	plan = db.execute("SELECT week.day, events.time, events.event FROM week, events WHERE events.week_id = week.id")
	plan.each do |event|
		puts event.join('-')
	end
end

# allow the user to delete events
puts "Would you like to delete an event? (y/n)"
if gets.chomp == 'y'
	puts "What day is the event on?"
	day = gets.chomp
	index = days.index(day) + 1
	puts "Which event would you like to delete from #{day}?"
	deleted = gets.chomp
	db.execute("DELETE FROM events WHERE events.event = ? AND events.week_id = ?", [deleted, index])
end

# remind the user of the important events
puts '----------------------'
puts "Dont forget to attend:"
important = db.execute("SELECT week.day, events.time, events.event FROM week, events WHERE events.week_id = week.id AND events.urgent = 'true'")
important.each do |event|
	puts '----------------------'
	puts event.join('-')
end
puts '----------------------'

