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
		# make a new key with the input quantity
	list[:item] = list[:item] + quantity
	# output:
		# updated list
	p list
end



make_list("grapes milk cheese")
# add_item("apples", 4, new_list)








