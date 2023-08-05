=begin
Write a method that combines two Arrays passed in as arguments, and returns
a new Array that contains all elements from both Array arguments, with the
elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same
number of elements.
=end

# def interleave(arr1, arr2)
#   result = []
#   count = 0

#   loop do
#     break if count == arr1.size
#     result << arr1[count]
#     result << arr2[count]
#     count += 1
#   end

#   result
# end

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten(1)
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
