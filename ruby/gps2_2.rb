# Method to create a list
def make_list(items)
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # initialize an empty hash
  list = Hash.new
  # split string into an array
  array = items.split(' ')
  	# iterate through the array
  	array.each do |item|
  		# add each element to the list as a key
  		# set default quantity of 0
  		list[item.to_sym] = 0
  	end
  # print the list to the console [can you use one of your other methods here?]
  print(list)
  # output: [what data type goes here, array or hash?]
  list
end


# Method to add an item to a list
# input: item name and optional quantity
def add_item(item, quantity, list)
	# steps: 
	# if the item is already in the list
	if list[item.to_sym] 
		# add to the quantity
		#list[item.to_sym] = list[item.to_sym] + quantity
		list[item.to_sym] += quantity
	# otherwise
	else
		# make a new key with the input quantity
		list[item.to_sym] = quantity
	end
	# output:
		# updated list
	list
end


# Method to remove an item from the list
# input: item to be removed, and the list
def remove_item(item, list)
	# steps: delete the item if it exists
	list.delete_if {|list_item| list_item == item.to_sym}
	# output: updated list
	list
end


# Method to update the quantity of an item
# input: item, new quantity and the list
def update(item, quantity, list)
	# steps: if the item is in the list
	if list.include? item.to_sym
		# update the quantity
		list[item.to_sym] = quantity
	else 
		add_item(item, quantity, list)
	end
	# output: return the updated list
	list
end


# Method to print a list and make it look pretty
# input: list
def print(list)
# steps: 
	# make a new string
	string = "This is the shopping list: \n"
	# iterate through the list
	list.each do |item, quantity|
		# add the items and quantities to the string and end with a newline
		string = string + "#{item}: #{quantity} \n"
	end
# output: the string
	puts string
end


new_list = make_list("grapes milk cheese")
p add_item("apples", 4, new_list)
p remove_item("milk", new_list)
p update("grapes", 900, new_list)
print(new_list)


# REFLECTIONS:

# 1) I learned new formats for breaking down my pseudocode. 
# I used to have pseudo code that was very similar to actual code but breaking it into input, steps and output helped to clarify the objectives.

# 2) Hashes allow us to store the variety and quantity together while arrays would have a harder time associating 'apples' with the number of apples.
# I don't see any downside to using the hashes. They might take up more room and be slower than arrays but not enough to make a difference with a program like this.

# 3) A method returns the result of the last line of code in it's body. 

# 4) you can pass any data type into a method as an argument:
# booleans, strings, floats, integers, arrays, hashes, nil...
# It really depends on what the method is trying to do with it's argmuents.

# 5) You can pass information from one method to another by changing some piece of data in the global-scope.
# you can also pass the return-value from one method into another as an argument.
# the most efficient way I know about now is using a class to make data avaliable across multiple methods.

# 6) My understanding of implicit return and argument declaration improved over this challenge. 
# I also got more comfortable with the layout of hashes and converting strings to symbols and back.




