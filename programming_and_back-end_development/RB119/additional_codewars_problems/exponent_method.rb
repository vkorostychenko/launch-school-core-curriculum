=begin
Difficulty: medium

Create a method called "power" that takes two integers and returns the value of 
the first argument raised to the power of the second. Return nil if the second 
argument is negative.

Note: The ** operator has been disabled.

Input: given two integers (might be negative)
Output: an integer or nil

Rules:
  - given two integers
  - return the fist integer in the power of the second integer
  - if the power is negative
    - return nil

Algorithm:
  - given two integers
  - if the pow is negative
    - retrun nil
  - else if the pow is equal to 0
    - return 1
  - else
    - multiply number by self pow times and return it
  - end
=end

def power(num, pow)
  case
  when pow.negative? then nil
  when pow.zero?     then 1
  else Array.new(pow, num).reduce(:*)
  end
end

p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(10, 0) == 1
p power(2, 3) == 8
p power(3, 2) == 9
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(8, -2) == nil
