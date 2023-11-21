=begin
If we list all the natural numbers below 10 that are multiples of 3 or 5,
we get 3, 5, 6 and 9. The sum of these multiples is 23.

Finish the solution so that it returns the sum of all the multiples of 3 or 5
below the number passed in.

Additionally, if the number is negative, return 0.

Note: If the number is a multiple of both 3 and 5, only count it once.

Input: an Integer
Output: an Integer

Rules:
  - Explicit:
    - get all multiples of 3 and 5 of the given number
    - count only once if the number is multiple of both
    - sum up these multiples
    - if the number is negative, return 0
  - Implicit:
    - not include the given number

Data Structure
  - 

Algorithm:
  - given an integer
  - return 0 if the integer is negative
  - iterate through a range from 1 up to the integer exclusively
    - select the current number if it is a multiple of 3 OR a multiple of 5
  - get the sum of the array of selected numbers
=end

def solution(number)
  return 0 if number.negative?

  (1...number).select do |n|
    n % 3 == 0 || n % 5 == 0
  end.sum
end

p solution(2) == 0
p solution(-10) == 0
p solution(20) == 78
p solution(200) == 9168
