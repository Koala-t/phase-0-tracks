def ask_name()
	puts "What is your name?"
	return gets.chomp
end

def ask_age()
	puts "What is your age?"
	return gets.chomp
end

def ask_dob()
	puts "When were you born?"
	return gets.chomp
end

def food_preference()
	puts "Our company cafeteria serves garlic bread. Should we order some for you?"
	return gets.chomp
end

def insurance()
	puts "Would you like to enroll in the company’s health insurance?"
	return gets.chomp
end

name = ask_name()
age = ask_age()
dob = ask_dob()
garlic = food_preference()
covered = insurance()
check_dob = 2016 - age.to_i



if check_dob.to_s == dob && (garlic == "yes" || covered == "yes")
	result = "Probably not a vampire"
end

if name == "Drake Cula" || name == "Tu Fang" || name == "Allucard"
	result = "Definitley a vampire"
end

puts result;
