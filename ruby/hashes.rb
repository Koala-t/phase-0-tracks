# Program to store client details

# make a method to convert y/n to booleans
def truth(a)
	if a == "y"
		return true
	else
		return false
	end
end

# make a method to ask for and store a users...
def Client_info
	info = {}
	# ...name
	puts "Please enter your name:"
		info[:name] = gets.chomp
	# ...age
	puts "How old are you:"
		# convert to an integer
		info[:age] = gets.chomp.to_i
	# ...favorite color
	puts "What is your favorite color:"
		info[:color] = gets.chomp
	# ...number of children
	puts "How many children do you have:"
		# convert answer to an integer
		info[:children] = gets.chomp.to_i
	# ...do they think lead poisioning is a myth
	puts "You don't buy that whole 'lead is bad for you' malarkey do you?(y/n)"
		# convert answer to boolean
		info[:lead] = truth(gets.chomp)

	# print the hash to the screen
	info.each {|key, value| puts key.to_s + ": " + value.to_s}

	# ask the user if all the info is correct
	puts "Does this look right?(y/n)"
		# if no...
		if gets.chomp == "n"
			# ask which field is incorrect
			
			# update it 
		# if yes...	
		else
			# move on
			puts "Great!"
		end
	# print the hash again
	puts info
end 

Client_info()