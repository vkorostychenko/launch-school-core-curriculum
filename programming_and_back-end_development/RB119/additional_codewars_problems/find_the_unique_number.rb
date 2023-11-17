=begin
There is an array with some numbers. All numbers are equal except for one.
Try to find it!

find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

It’s guaranteed that array contains at least 3 numbers.

The tests contain some very huge arrays, so think about performance.

Input: an array
Output: an integer

Rules:
  - given an array containing at least 3 numbers (integers or floats)
  - return a number that appears only once

Algorithm:
  - given an array
  - create an array containing unique values from the input array
  - take the first element
    - if this element appears in the input array once
      - return this number
    - otherwise, return the second number

=end

def find_uniq(arr)
  first, second = arr.uniq

  arr.one?(first) ? first : second
end

p find_uniq([1,1,1,1,0]) == 0
p find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
p find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55
