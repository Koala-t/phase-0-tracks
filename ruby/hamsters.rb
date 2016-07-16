puts "hamster's name"
	name = gets.chomp
puts "how loud is the hammy for 1 to 10"
	volume = gets.chomp.to_i
puts "what is the fur color"
	color = gets.chomp
puts "do they seem friendly and healthy (true or false)"
	adoptable = gets.chomp
puts "estimated age, if unknown mark n/a"
	age = gets.chomp

puts "The hamster's name is #{name}"
puts "The hamster's volume from 1 to 10 is #{volume}"
puts "The hamster's fur color is #{color}"

if adoptable == "true"
	adoptable = true
	puts "This hamster is great for adopting!"
else 
	adoptable = false
	puts "Adopt a different hamster..."
end

if age == "n/a"
	puts "We don't know how long you'll have to deal with this thing."
	age = nil
else 
	age = age.to_i
	puts "This hamster is #{age} years old."
end