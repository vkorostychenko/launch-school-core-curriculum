# The Enumerable#max_by method iterates over the members of a collection, passing
# each element to the associated block. It then returns the element for which the
# block returned the largest value.

# Write a method called max_by that behaves similarly for Arrays. It should take
# an Array and a block, and return the element that contains the largest value.

# If the Array is empty, max_by should return nil.

# Your method may use #each, #each_with_object, #each_with_index, #reduce, loop,
# for, while, or until to iterate through the Array passed in as an argument, 
# but must not use any other methods that iterate through an Array or any other
# collection.

# Examples:

=begin
Algorithm:

Given an array and a block.
Do not mutate the given array.
Initialize a local variable result to nil.
Iterate over the array with an index.
On each iteration yield the current element to the block.
Assign the return value of the previous step to the local variable.




Example:

[1, 5, 3] - input
 3, 7, 5  - return value from the block on each iteration

 Should return the element at index 1, which is 5.
=end

def max_by(array)
  max_element = nil
  array.each do |element|
    if max_element.nil?
      max_element = element
    else
      max_element = element if yield(element) > yield(max_element)
    end
  end
  max_element
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil
