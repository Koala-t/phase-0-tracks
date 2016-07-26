# make a class
class Game
# add attributes for target_word, guessed_letters, guessed_word, number_of_guesses
	attr_reader :number_of_guesses
	attr_accessor :target_word, :guessed_letters, :guessed_word

# add methods for getting the target_word, guessing letters
	# initalize setting the guessed_letters and guessed_word to empty arrays
	def initialize
		@guessed_letters = []
		@guessed_word = []
	end

	# get the target word from the user, set the number of guesses and build the guessed_word
	def target(word)
		@target_word = word
		word.length.times(@guessed_word <<  '_')
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
# get the target word
# have the user start guessing
	# inform them if they make the same guess twice
	# check if a new guess is in the target-word
		# update the guessed_word
		# decrement the remaining guesses
# stop the guessing when the word is complete or there are no more guesses left