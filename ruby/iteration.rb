
#Release 0

def names
	name1 = "chris"
	name2 = "kyle"
	puts "who is in here?"
	yield(name1, name2)
end


puts names{ |name1 , name2| "#{name1} and #{name2} are partners"}

letters = ["a","b","c"]

info = {name: "Chris", hometown: "Sewers of NY", favorite_food: "pizza"}




#Release 1
p letters
letters.map! do |letter|
	letter.next
end
p letters

letters.each do |letter|
	puts letter
end

info.each do |question, response|
	puts "#{question}: #{response}"
end





#Array 1-4 Release 2
numbers = [1,2,3,4,5,6,7,8,9]

numbers.delete_if {|digit| digit >= 7 }
p numbers

numbers.keep_if {|digit| digit == 2 }
p numbers

p [1,2,3,4,5,6].select {|digit| digit.even?}

p [1,2,3,4,5].take_while {|digit| digit < 4} 



#Hashes 1-4 Release 2

characters = {"two" => 2, "three" => 3, "four" => 4, "five" => 5}

p characters.delete_if{|word, number| word == "four"}

p characters.keep_if{|word, number| word == "two" || word == "five"}

p characters.select!{|word, number| number > 3}

characters = {"two" => 2, "three" => 3, "four" => 4, "five" => 5}

#if condition is true remove item from data structure
# if false stop

characters.select! do |word, number|
	number < 4
	break if number == 4
	puts number
end

puts characters