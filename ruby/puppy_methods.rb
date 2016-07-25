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