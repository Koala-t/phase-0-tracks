# Program to store client details

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
		info[:lead] = gets.chomp

	# print the hash to the screen

	# ask the user if all the info is correct
		# if no...
			# ask which field is incorrect
			# update it 
		# if yes...
			# move on

	# print the hash again
	puts info
end 

Client_info()