# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

# Examples:

# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".

=begin
Input: an array of integers
Output: an integer or nil

Rules:
  - method takes one argument
  - should return the minimum sum of 5 consecutive integers of input
  - if the input contains fewer than 5 elements - return nil

Questions:
  - What if the input array contains invalid values? For example - nil.

Algorithm:
  - return nil if the input array length is less than 5
  - iterate through the input array to find all the possible combinations of
    5 consecutive integers and store their sums in an array object
    - reference 5 elements starting from index 1, break if their length is less
      than 5
    - append their sum in sums array
  - return the minimum value of sums array
=end

def minimum_sum(arr)
  return nil if arr.size < 5

  sums = []

  arr.each_index do |idx|
    sums << arr[idx, 5].sum if arr[idx, 5].size == 5
  end

  sums.min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
