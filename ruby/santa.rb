# make a santa class
# Give it an initialize method and 2 other methods

class Santa
	attr_reader :ethnicity, :reindeer_ranking
	attr_accessor :gender, :age

	def initialize(gender, ethnicity)
		puts "Initializing Santa instance ..."
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
	end

	def speak
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies(cookie)
		puts "That was a good #{cookie}!" 
	end

	def celebrate_birthday
		@age += 1
	end

	def get_mad_at(reindeer)
		reindeer_ranking.delete(reindeer)
		reindeer_ranking << reindeer
	end

	

	# bonus method
	def introduction
		puts "Hi! My name is santa, I'm a #{@ethnicity} #{@gender} who is #{@age} years old and I'm chock full of holiday spirit!"
	end

end

# driver code
test = Santa.new('male', 'etheopian')
test.speak
test.eat_milk_and_cookies("oreo")
test.introduction
p test.age
test.celebrate_birthday
p test.age
test.get_mad_at("Dasher")
p test.reindeer_ranking
p test.gender
test.gender = "female"
p test.gender
p test.ethnicity


# example input
genders = ['male', 'female', 'bigender', 'prefer not to say']
ethnicities = ['black', 'white', 'latino', 'prefer not to say']

# make 10 santas with random genders and ethnicities from the example input
conference_attendees = []
10.times do 
	conference_attendees << Santa.new(genders[rand(4)], ethnicities[rand(4)])
end




# making LOTS of santas
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]

100.times do
	another_santa = Santa.new(example_genders.sample, example_ethnicities.sample)
	another_santa.age = rand(140)
	p another_santa.age
	p another_santa.gender
	p another_santa.ethnicity
	p another_santa.reindeer_ranking
end

