def ask_name()
	puts "What is your name?"
	return gets.chomp
end

name = ask_name()
puts name