require_relative 'hangman'

describe Game do
	let(:game) {Game.new}
	# the game should
	# initalize with a guessed_letters and guessed_words
	it "initialize" do
		expect(game.guessed_letters).to eq []
	end
	# take a target word and set number_of_guesses to 2 times the length of the input word
	it "take input" do
		expect(game.target('tree')).to eq 8
	end
	# allow the user to guess if the word has ceratain letters
	it "guess letters" do
		game.target('tree') # need this line otherwise the target will be nil
		expect(game.guess('t')).to eq true
	end

end