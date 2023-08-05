=begin
Write a method named include? that takes an Array and a search value as
arguments. This method should return true if the search value is in the array,
false if it is not. You may not use the Array#include? method in your solution.
=end

# def include?(arr, val)
#   arr.each do |el|
#     return true if el == val
#   end

#   false
# end

def include?(arr, val)
  arr.any?(val)
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false
