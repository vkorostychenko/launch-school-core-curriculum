=begin
The maximum sum subarray problem consists of finding the maximum sum of a
contiguous subsequence in an array of integers:

maxSequence [-2, 1, -3, 4, 1, 2, 1, -5, 4) --> should be 6: [4, -1, 2, 1]

Easy case is when the array is made up of only positive numbers and the maximum
sum is the sum of the whole array. If the array is made up of only negative
numbers, return 0 instead.
Empty array is considered to have zero greatest sum, Note that the empty array
is also a valid subarray.
=end

=begin
Input: an array of integers
Output: a positive integer

Rules:
  - find a maximum sum of a contiguous subsequence in an array of integers
  - if the input array is made up of only negative numbers, return 0
  - an empty array is considered to have a 0 greatest sum

Examples:
maxSequence [-2, 1, -3, 4, 1, 2, 1, -5, 4) --> should be 6: [4, -1, 2, 1]

Algorithm:
  - return 0 if the input array is empty or all numbers within it are negative
  - initialise the local variable to store the max_sum of the sequence
  - outer iterator will iterate through the indices of the input array
    - inner iterator will iterate from the current index up to the length - 1 of
      the input array
      - slice the input array [outer_index..inner_index]
      - find the current sum of the sequence
      - reassign the max_sum to the current_sum if the current_sum is greater
        than max_sum
  - return max_sum
=end

def max_sequence(arr)
  return 0 if arr.empty? || arr.all?(&:negative?)

  max_sum = 0

  arr.each_index do |outer_idx|
    (outer_idx...arr.size).each do |inner_idx|
      current_sum = arr[outer_idx..inner_idx].sum
      max_sum = current_sum if current_sum > max_sum
    end
  end

  max_sum
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
