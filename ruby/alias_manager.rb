# helper function to change vowels
def change_vowels(word)
	vowels = 'aeiou'.split('')
	letters = word.split('')
	new_word = ''
	# look each letter in turn
	letters.each do |letter|
		# if the letter is a vowel
		if vowels.include? letter
			# look at each vowel in turn
			vowels.each do |vowel|
				# if the letter is any of the vowels
				if letter == vowel && vowel != 'u'
					# change the letter to the next vowel
					new_word << vowels[vowels.index(vowel) + 1]
					# if the vowel is 'u' change it to 'a'
				elsif letter == vowel && letter == 'u'
					new_word << 'a'
				end
			end
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
	# put them back together
end

puts change_vowels('apple')

puts alias_maker("freddy mercury")