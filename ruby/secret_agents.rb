puts "What secret would you like to keep?"
input = gets.chomp

def encode(secret)
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
	return secret
end

encoded = encode(input)




# declare method
def decode(encoded_secret)
	# make alphabet string
	alphabet = "abcdefghijklmnopqrstuvwxyz"
	index = 0

	while index < encoded_secret.length
		# get next letter in input
		letter = encoded_secret[index]
		# find it in the alphabet
		new_letter = alphabet[alphabet.index(letter) - 1]
		# change it to the preceeding letter
		encoded_secret[index] = new_letter
		index += 1
	end

	puts encoded_secret
# end method
end


puts "would you like to decode the secret? (y/n)"
response = gets.chomp

if response == "y"
	decode(encoded)
end







