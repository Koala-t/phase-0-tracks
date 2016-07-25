class Puppy

  def initialize
  	puts "Initializing new puppy instance..."
  end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(integer)
  	puts "Woof!"*integer
  end

  def roll_over
  	puts "*rolls over*"
  end

  def dog_years(human_years)
  	human_years*7
  end

  def wait(time)
  	sleep(time)
  	puts "waiting"
  end

  	

end

spot = Puppy.new
spot.fetch("bone")
spot.speak(3)
spot.roll_over
p spot.dog_years(2)
spot.wait(4)




# making a new class
# Baseball player class
# throw and catch methods
class Baseball_player

	def initialize
		puts "new Baseball_player"
	end

	def throw(location)
		puts "He threw the ball to #{location}"
	end

	def catch(caught)
		if caught
			puts "He caught it!"
		else
			puts "Ohhhhh NOOOOO!"
		end
	end

end


ricky = Baseball_player.new
ricky.throw("left field.")
ricky.catch(true)

roster = []
number_of_players = 0
while number_of_players < 50
	roster << Baseball_player.new
	number_of_players += 1
end


roster.each do |instance|
	instance.throw("home")
	instance.catch(true)
end






