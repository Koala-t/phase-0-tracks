# make a class
class Game
# add attributes for target_word, guessed_letters, guessed_word, number_of_guesses
	attr_reader :number_of_guesses
	attr_accessor :target_word, :guessed_letters, :guessed_word

# add methods for getting the target_word, guessing letters
	# initalize setting the guessed_letters and guessed_word to empty arrays
	def initialize
		puts "You have started a game of hangman!"
		@guessed_letters = []
		@guessed_word = []
	end

	# get the target word from the user, set the number of guesses and build the guessed_word
	def target(word)
		@target_word = word
		word.length.times {@guessed_word <<  '_'}
		@number_of_guesses = word.length * 2
	end

	# let the user guess a letter
	def guess(letter)
		if @target_word.include? letter
			true
		else
			false
		end
	end
end


# driver code
# make an instance
hangman = Game.new
# get the target word
puts "Please enter the word you would like your friends to try and guess:"
hangman.target(gets.chomp)

# have the user start guessing
# stop the guessing when the word is complete or there are no more guesses left
until hangman.guessed_letters.length == hangman.number_of_guesses || !hangman.guessed_word.include?('_')
	puts "Make a guess"
	guess = gets.chomp
 	# check if the guess was valid
	if guess.is_a?(String) && guess.length == 1
		# inform them if they make the same guess twice
		if hangman.guessed_letters.include? guess
			puts "You have already guessed that letter, try again."
		# check if the new guess is in the target-word
		elsif hangman.guess(guess)
			# find the locations where the guessed letter appears in the target_word
			indexes = []
			i = 0
			hangman.target_word.each_char do |letter|
				if letter == guess
					indexes << i
				end
				i += 1
			end
			# add the guessed letter to the guessed_word
			indexes.each do |position|
				hangman.guessed_word[position] = guess
			end
			# add the guess to guessed_letters
			hangman.guessed_letters << guess
			# inform the user they were correct and the status of the guessed_word
			puts "Well done! You have made a correct guess!"
			puts hangman.guessed_word.join(' ')
		# if they were wrong and havent used that guess before
		else
			# add the guess to the guessed_letters
			hangman.guessed_letters << guess
			# inform them that they didn't get the guess right
			puts "Too bad, that letter isn't in the word."
			# print out their progress
			puts hangman.guessed_word.join(' ')
		end
	# if the guess was invalid
	else
		puts "Please only guess one letter at a time."
	end
end

if hangman.guessed_word.include? '_'
	puts "You failed to guess the word in time."
else
	puts "congratulations!"
end