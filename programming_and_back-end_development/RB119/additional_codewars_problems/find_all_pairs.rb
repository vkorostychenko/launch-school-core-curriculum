=begin
You are given array of integers, your task will be to count all pairs in that
array and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once.
E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)

Examples

[1, 2, 5, 6, 5, 2]  -->  2

...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4

...because there are 4 pairs: 2, 20, 6 and 2 (again)
=end

=begin
Input: an array
Output: an integer

Rules:
  - given an array of integers
  - count all pairs in that array and return their count
  - return 0 if the input array is empty or contains only one value
  - if there are more pairs of a certain number, count each pair only once
  
Algorithm:
  - initialise the local variable count_pairs to 0
  - iterate over unique values of the input arr
    - count the current number in the input array
    - perform an integer division by 2
    - increment count_pairs by the result of that division
  - return count pairs
=end

def pairs(arr)
  arr.uniq.sum { |num| arr.count(num) / 2 }
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0
