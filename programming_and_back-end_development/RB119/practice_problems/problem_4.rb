# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Examples:

# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".

=begin
Input: an array of integers
Output: an array of two integers

Rules:
  - return an array containing two numbers that are closest together in value

Examples:
[5, 25, 15, 11, 20]

[5, 25] -> 20
[5, 15] -> 10
[5, 11] -> 6
[5, 20] -> 15
[25, 15] -> 10
[25, 11] -> 14
[25, 20] -> 5
[15, 11] -> 4 = min sum
[15, 20] -> 5
[11, 20] -> 9

Questions:
  - Should this method return a new object or modify the original one?
  - Does the order of two elements in the output array matter?
  - Does an array include only positive integers?

Algorithm:
  - create an empty array to store pairs
  - outer iterator will iterate through each index
    - inner iterator will iterate through the range from (outer_index + 1) to
      the (length - 1) of the input array
      - append each pair [arr[outer_idx], arr[inner_idx]] into pairs
  - sort an array of pairs by the result of a subtraction of a smaller number
    from greater
  - return the first pair
=end

def closest_numbers(arr)
  pairs = []

  arr.each_index do |outer_idx|
    ((outer_idx + 1)...arr.size).each do |inner_idx|
      pairs << [arr[outer_idx], arr[inner_idx]]
    end
  end

  pairs.sort_by do |pair|
    (pair[0] - pair[1]).abs
  end.first
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]
