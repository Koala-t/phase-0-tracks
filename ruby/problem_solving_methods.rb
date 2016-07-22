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


def fib(num)
  
  if num == 0
    return []
  
  elsif num == 1
    return [0]
  
  else
    start_array = [0, 1]
    while start_array.length < num
      start_array << (start_array[-1] + start_array[-2])
    end
  end
  return start_array
end

# define the method
def bubble_sort(array)
  # iterate through the array
  array.each do
    first = 0
    second = 1
    array.map do |value|
      
      # compare two adjacent values
      if array[second] && value > array[second]
      # move the greater value to the right and the lesser left
        save = array[first]
        array[first] = array[second]
        array[second] = save
      end
      first += 1
      second += 1
    end
  end
print array
end

 

#driver code
array = [42, 89, 23, 1]
search_array(array, 89)
  
fib(6)
print fib(100).last == 218922995834555169026

bubble_sort([10,5,2, 500, 34, 56, 67, 33, 20, 3])