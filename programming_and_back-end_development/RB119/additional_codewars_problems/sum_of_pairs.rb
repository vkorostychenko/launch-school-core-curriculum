=begin
Sum of Pairs

Given a list of integers and a single sum value, return the first two values
(parse from the left please) in order of appearance that add up to form the sum.

If there are two or more pairs with the required sum, the pair whose second
element has the smallest index is the solution.

sum_pairs([11, 3, 7, 5],         10)
#              ^--^      3 + 7 = 10
== [3, 7]

sum_pairs([4, 3, 2, 3, 4],         6)
#          ^-----^         4 + 2 = 6, indices: 0, 2 *
#             ^-----^      3 + 3 = 6, indices: 1, 3
#                ^-----^   2 + 4 = 6, indices: 2, 4
#  * the correct answer is the pair whose second value has the smallest index
== [4, 2]

sum_pairs([0, 0, -2, 3], 2)
#  there are no pairs of values that can be added to produce 2.
== None/nil/undefined (Based on the language)

sum_pairs([10, 5, 2, 3, 7, 5],         10)
#              ^-----------^   5 + 5 = 10, indices: 1, 5
#                    ^--^      3 + 7 = 10, indices: 3, 4 *
#  * the correct answer is the pair whose second value has the smallest index
== [3, 7]

Negative numbers and duplicate numbers can and will appear.

NOTE: There will also be lists tested of lengths upwards of 10,000,000 elements.
Be sure your code doesn't time out.

Input: an array and an integer
Output: an array

Rules:
  - Explicit:
    - Given a list of integers and a single sum value
    - return the first two values that add up equal to the given integer
    - if there are more pairs with the required sum, return the one where
      the second element has the smallest index
    - return nil if there are no pairs with their sum equal to the given integer
    - negative numbers and duplicate numbers can and will appear.

Algorithm:
  - return nil if the input array is empty or has one element
  - initialize the local variable last_idx to the length of the input
    array - 1
  - initialize the local variable min_second_idx to nil
  - initialize the local variable pair to nil
  - outer iterator will iterate through each index of the input array except
    the last one
    - inner iterator will iterate through each index of the input array starting
      from current outer index + 1 up to the last_idx
      - next iteration if the number at the current index of the outer iterator
        is equal to sum AND NOT equal to 0
      - initialize the local variable current_pair to an array containing the
        current outer iterator and the number that is at the current index of
        the inner iterator in the input array
      - if the sum of the current pair is equal to the sum AND min_second_idx is
        NOT nil OR the current inner index is less than the min_second_idx
        - reassign the last_idx to the current inner index
        - reassign the min_second_idx to the current inner index
        - reassign pair to the current_pair
  - return pair
=end

def sum_pairs(arr, sum)
  return nil if arr.empty? || arr.one?

  last_idx = arr.size - 1
  min_second_idx = nil
  pair = nil

  (0...last_idx).each do |first_idx|
    (first_idx + 1).upto(last_idx) do |second_idx|
      next if arr[first_idx] == sum && arr[first_idx] != 0
      current_pair = [arr[first_idx], arr[second_idx]]
      
      if current_pair.sum == sum && (min_second_idx.nil? || second_idx < min_second_idx)
        min_second_idx = second_idx
        last_idx = second_idx
        pair = current_pair
      end
    end
  end

  pair
end

l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]

p sum_pairs(l1, 8) == [1, 7]
p sum_pairs(l2, -6) == [0, -6]
p sum_pairs(l3, -7) == nil
p sum_pairs(l4, 2) == [1, 1]
p sum_pairs(l5, 10) == [3, 7]
p sum_pairs(l6, 8) == [4, 4]
p sum_pairs(l7, 0) == [0, 0]
p sum_pairs(l8, 10) == [13, -3]
