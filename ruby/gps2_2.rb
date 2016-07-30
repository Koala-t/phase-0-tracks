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
  p list
  # output: [what data type goes here, array or hash?]
  list
end


# Method to add an item to a list
# input: item name and optional quantity
def add_item(item, quantity, list)
	# steps: 
	# if the item is already in the list
	if list[item] != nil
		# add to the quantity
		list[item.to_sym] = list[:item] + quantity
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
	list.delete_if {|key| key == item.to_sym}
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
	string
end


new_list = make_list("grapes milk cheese")
p add_item("apples", 4, new_list)
p remove_item("milk", new_list)
p update("grapes", 900, new_list)
puts print(new_list)







