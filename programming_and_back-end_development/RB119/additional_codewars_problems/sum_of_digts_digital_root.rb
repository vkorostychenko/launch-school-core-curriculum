=begin
Difficulty: ___

A digital root is the recursive sum of all the digits in a number. Given n, 
take the sum of the digits of n. If that value has more than one digit, 
continue reducing in this way until a single-digit number is produced. This 
is only applicable to the natural numbers.

Here's how it works:

  digital_root(16)
  => 1 + 6
  => 7

  digital_root(942)
  => 9 + 4 + 2
  => 15 ...
  => 1 + 5
  => 6

  digital_root(132189)
  => 1 + 3 + 2 + 1 + 8 + 9
  => 24 ...
  => 2 + 4
  => 6

  digital_root(493193)
  => 4 + 9 + 3 + 1 + 9 + 3
  => 29 ...
  => 2 + 9
  => 11 ...
  => 1 + 1
  => 2

Input: an integer
Output: an integer

Rules:
  - given an integer
  - sum up the digits of the integer until their sum is less than 10 and return
    this number

Algorithm:
  - given an integer
  - if the given integer is greater than 9
    - split the integer into an array of digits
      - find the sum
      - call the method again with the sum as an argument
  - otherwise, return integer
=end

def digital_root(n)
  n > 9 ? digital_root(n.digits.sum) : n
end

p digital_root(16) == 7
p digital_root(456) == 6
