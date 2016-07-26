# make a module
module Shout
	def self.yell_angrily(words)
		words + "!!!" + " :("
	end

	def self.yell_happily(words)
		words + "!!!" + " :D"
	end
end


# driver code
p Shout.yell_angrily("It wasn't supposed to end like this")
p Shout.yell_happily("We're going to Paris")