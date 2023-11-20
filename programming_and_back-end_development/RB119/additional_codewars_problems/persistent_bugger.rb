=begin
Difficulty: medium

Write a function, persistence, that takes in a positive parameter num and 
returns its multiplicative persistence, which is the number of times you 
must multiply the digits in num until you reach a single digit.

For example:

 persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4
                 # and 4 has only one digit

 persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126,
                  # 1*2*6=12, and finally 1*2=2

 persistence(4) # returns 0, because 4 is already a one-digit number

Input: an integer
Output: an integer

Rules:
  - given an integer
  - return the number of times we can multiply its digits until we reach
    a single digit

Algorithm:
  - given an integer
  - initialize a counter to 0
  - while the input integer is greater than 9
    - reassign the input integer to the product of its digits
    - increment counter by 1
  - return counter
=end

def persistence(n)
  count = 0
  
  while n > 9
    n = n.digits.reduce(:*)
    count += 1
  end

  count
end

p persistence(39) == 3
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4
