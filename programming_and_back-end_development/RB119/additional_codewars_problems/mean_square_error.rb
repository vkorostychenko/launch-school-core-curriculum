=begin
Difficulty: medium

Complete the function that accepts two integer arrays of equal length and
compares the value each member in one array to the corresponding member in 
the other

Then squares the absolute value difference between those two values and 
returns the average of those squared absolute value difference between each 
member pair.

Examples
[1, 2, 3], [4, 5, 6]              -->   9   because (9 + 9 + 9) / 3
[10, 20, 10, 2], [10, 25, 5, -2]  -->  16.5 because (0 + 25 + 25 + 16) / 4
[-1, 0], [0, -1]                  -->   1   because (1 + 1) / 2

=end

p solution([1, 2, 3], [4, 5, 6]) == 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
p solution([-1, 0], [0, -1]) == 1

=begin
Difficulty: medium

Complete the function that accepts two integer arrays of equal length and
compares the value each member in one array to the corresponding member in 
the other

Then squares the absolute value difference between those two values and 
returns the average of those squared absolute value difference between each 
member pair.

Examples
[1, 2, 3], [4, 5, 6]              -->   9   because (9 + 9 + 9) / 3
[10, 20, 10, 2], [10, 25, 5, -2]  -->  16.5 because (0 + 25 + 25 + 16) / 4
[-1, 0], [0, -1]                  -->   1   because (1 + 1) / 2

Input: two arrays
Output: an integer

Rules:
  - given two integer arrays of equal lengths
  - compare two corresponding elements and find the difference
  - square the absolete difference between two elements
  - return the average

Algorithm:
  - given two arrays arr1 and arr2
  - iterate through the arr1 for transformation with index
    - subtract the number at the current index in the arr2 from the current element and find the absolute value
    - square the value
  - sum up the elements of the mapped array and divide the sum by the length of the array and return it
=end

def solution(arr1, arr2)
  result = arr1.map.with_index do |num1, idx|
            ((num1 - arr2[idx]).abs) ** 2
          end

  result.sum.to_f / result.size
end

p solution([1, 2, 3], [4, 5, 6]) == 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
p solution([-1, 0], [0, -1]) == 1



