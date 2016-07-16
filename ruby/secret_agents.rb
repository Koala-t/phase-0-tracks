puts "What secret would you like to keep?"
input = gets.chomp

def encode(secret)
	i = 0

	# determine string length
	length = secret.length
	# iterate through the string
	while i < length
		# change each letter to the next letter in the alphabet
		secret[i] = secret[i].next
		# overwrite the old string with the new string
		i += 1
	end

	puts secret
	return secret
end

encoded = encode(input)




# declare method
def decode(encoded_secret)
	# make alphabet string
	alphabet = "abcdefghijklmnopqrstuvwxyz"
	i = 0

	while i < encoded_secret.length
		# get next letter in input
		letter = encoded_secret[i]
		# find it in the alphabet
		new_letter = alphabet[alphabet.index(letter) - 1]
		# change it to the preceeding letter
		encoded_secret[i] = new_letter
		i += 1
	end

	puts encoded_secret
# end method
end


puts "would you like to decode the secret? (y/n)"
response = gets.chomp

if response == "y"
	decode(encoded)
end







