
=begin
Difficulty: easy

You've just discovered a square (NxN) field and you notice a warning sign. The 
sign states that there's a single bomb in the 2D grid-like field in front of you.

Write a function mineLocation/MineLocation that accepts a 2D array, and returns 
the location of the mine. The mine is represented as the integer 1 in the 2D 
array. Areas in the 2D array that are not the mine will be represented as 0s.

The location returned should be an array where the first element is the row 
index, and the second element is the column index of the bomb location (both 
should be 0 based). All 2D arrays passed into your function will be square (NxN), 
and there will only be one mine in the array.

Input: a nested array
Output: an array

Rules:
  - given a multidimensional array
  - within the array will be only one element that is 1
  - identify the indices of that 1
  - return an array containing the first element as the index representing the
    inner array and the second element as the index representing the index
    of '1' within the nested array

Algorithm:
  - given an array
  - iterate through the outer array with index
    - iterate through the inner array with index
      - if the current element of the inner array is equal to 1
        - return [outer_idx, inner_idx]
=end

def mineLocation(arr)
  arr.each_with_index do |inner_arr, outer_idx|
    inner_arr.each_with_index do |number, inner_idx|
      return [outer_idx, inner_idx] if number == 1
    end
  end
end


p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]
p mineLocation([ [1, 0], [0, 0] ]) == [0, 0]
p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]
