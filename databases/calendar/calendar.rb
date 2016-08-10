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
		day VARCHAR(255),
		day_id INT,
		FOREIGN KEY (day_id) REFERENCES day(id)
	)
SQL

add_day = <<-DAY_TABLE 
	CREATE TABLE IF NOT EXISTS day(
		id INTEGER PRIMARY KEY,
		event VARCHAR(255),
		time TIME,
		urgent BOOLEAN
	)
DAY_TABLE

db.execute(add_day)
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
#puts "Would you like to add an event to the calendar? (y/n)"
#if gets.chomp == 'n'
#	puts "have a nice day"
#else
#	puts "What day will the event take place?"
#	date = gets.chomp
#	puts "Please enter a short description of the event."
#	appointment = gets.chomp
#	# this adds another day (a new row)
#	# I could not add days at the start but just add days and events as I go
#		# this would be bad in terms of saving space
#		# try to add events to the events array on each existing day row
#	db.execute("INSERT INTO week (day, events) VALUES (?, ?)", [date, appointment])
#end

#p db.execute("SELECT events from week WHERE day='Monday'")



