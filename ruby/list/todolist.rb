class TodoList

	def initialize(item)
		@list = item
	end

	def get_items
		@list
	end

	def add_item(item)
		@list << item
	end

	def delete_item(item)
		@list.delete(item)
	end

	def get_item(index)
		@list[index]
	end

end
