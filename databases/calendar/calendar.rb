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
		events ARRAY
	)
SQL

db.execute(add_week)

