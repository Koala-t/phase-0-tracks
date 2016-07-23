# helper function to change vowels
def change_vowels(word)
	vowels = 'aeiouAEIOU'.split('')
	letters = word.split('')
	new_word = ''
	# look each letter in turn
	letters.each do |letter|

		# edge-cases
		# if the letter is a 'u'
		if letter == 'u'
			# change it to an 'a'
			new_word << 'a'
		# if the letter is a 'U'
		elsif letter == 'U'
			# change it to an 'A'
			new_word << 'A'

		# if the letter is a vowel other than u or a
		elsif vowels.include? letter
			# look at each vowel in turn
			vowels.each do |vowel|
				# if the letter is any of the vowels
				if letter == vowel
					# change the letter to the next vowel
					new_word << vowels[vowels.index(vowel) + 1]
				end
			end
		# if the letter isn't a vowel, add it to the new word
		else
			new_word << letter
		end		
	end
	return new_word
end



# take a name
def alias_maker(name)
	# Isolate the first and last names
	last_name = name.split(' ')[1]
	first_name = name.split(' ')[0]
	# swap their order
	new_name = [last_name, first_name].join(' ')
	# change vowels to the next vowel in 'aeiou'
	return change_vowels(new_name)
end






# driver code

# make a data structure to store agent-names
agents = {}

# repeat next steps until agents has 'exit' as a key
until agents.has_key?('exit')

	# prompt the user to input names
	puts "Greetings agent, enter your name to recieve a totally-cool codename."
	puts "Type exit to stop entering names"
	name = gets.chomp

	# add the name and it's code-name to the data structure
	agents[name] = alias_maker(name)

	if name != 'exit'
		puts agents[name]
	end

end

# remove exit from the data structure
agents.delete('exit')

# print the stored data
agents.each  {|name, codename| puts "#{name} the #{codename} is a smooth operator."}







