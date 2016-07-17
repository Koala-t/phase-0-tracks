def encode(secret)
	i = 0

	# determine string length
	length = secret.length
	# iterate through the string
	while i < length
		# if the letter is "z"
		if secret[i] == "z"
			# change it to "a"
			secret[i] = "a"
		else  
		# otherwise change the letter to the next letter in the alphabet
			secret[i] = secret[i].next
		end
		i += 1
	end

	#puts secret
	return secret
end

# declare method
def decode(encoded_secret)
	# make alphabet string
	alphabet = "abcdefghijklmnopqrstuvwxyz"

	i = 0
	while i < encoded_secret.length
		# get next letter in input
		letter = encoded_secret[i]
		# if the letter is "a"
		if letter == "a"
			# change it to "z"
			letter = "z"
		else
			# find the letter in the alphabet and change it to the preceeding letter
			encoded_secret[i]= alphabet[alphabet.index(letter) - 1]
		end
		i += 1
	end

	#puts encoded_secret
	return encoded_secret
# end method
end

#decode(encode("swordfish"))

#This works because the encode method evaluates 
#to a string which the decode method can then evaluate.



#ask the user if they would like to encode or decode a password
puts "Would you like to encode or decode a password?"
operation = gets.chomp

#ask them for the password
puts "What is the password?"
password = gets.chomp
#if they want to encode, run that program
if operation == "encode"
	puts encode(password)
#if they want to decode, run that program
elsif operation == "decode"
	puts decode(password)
end