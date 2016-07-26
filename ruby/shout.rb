=begin
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
=end


# make a mixin version of the module
module Shout
	def yell_angrily(words)
		words + "!!!" + " :("
	end

	def yell_happily(words)
		words + "!!!" + " :D"
	end
end

# include it in classes
class Clown
	include Shout
end

class Leprecaun
	include Shout
end

# test it out
ronald = Clown.new
p ronald.yell_angrily("That birthday went terribly")
p ronald.yell_happily("The prime minister liked my act")

lucky = Leprecaun.new
p lucky.yell_happily("I finally got my hands on the lucky charms")
p lucky.yell_angrily("Nooooo! They were stolen by those children again")