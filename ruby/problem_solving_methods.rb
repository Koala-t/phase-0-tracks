# method that takes an array and value
# returns an index
# nil if not present

def search_array(array, value)
  idx = 0
  array.each do
    if array[idx] == value      
      return idx
    end
    idx += 1
    if idx == array.length
      print "nil"
      return nil
    end
  end
end

#driver code
search_array([42, 89, 23, 1], 89)