
def encode
	puts "What secret would you like to keep?"
	secret = gets.chomp
	index = 0

	# determine string length
	length = secret.length
	# iterate through the string
	while index < length
		# change each letter to the next letter in the alphabet
		secret[index] = secret[index].next
		# overwrite the old string with the new string
		index += 1
	end

	puts secret
end

encode()



# declare method
	# make alphabet string
	
	# get next letter in input
		# find it in the alphabet
		# change it to the preceeding letter

# end method