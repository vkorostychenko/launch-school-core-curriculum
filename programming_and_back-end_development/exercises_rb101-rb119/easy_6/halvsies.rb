=begin
Write a method that takes an Array as an argument, and returns two Arrays (as a
pair of nested Arrays) that contain the first half and second half of the
original Array, respectively. If the original array contains an odd number of
elements, the middle element should be placed in the first half Array.
=end

def halvsies(arr)
  size_first_half = arr.size.ceildiv(2)
  first_half = arr.slice(0, size_first_half)
  second_half = arr.slice(size_first_half, arr.size - size_first_half)
  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
