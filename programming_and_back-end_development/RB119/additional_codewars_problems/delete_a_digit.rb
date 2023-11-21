=begin
Difficulty: easy

Given an integer n, find the maximal number you can obtain by deleting exactly one 
digit of the given number.

Example
  
  For n = 152, the output should be 52;

  For n = 1001, the output should be 101.

Constraints: 10 ≤ n ≤ 1000000.

Input: an integer
Output: an integer

Rules:
  - given an integer
  - find the maximal number you can obtain by deleting exactly one 
    digit of the given number and return it

Algorithm:
  - given an integer
  - split the input integer into an array of digits
  - iterate through a range from 0 up to the length of the digits array - 1 for
    transformation
    - iterate over each digit of the array of digits for selection with index
      - select digits that index is NOT equal to the current value of the outer
        iterator
      - join the digits together to a string and convert them to an integer
  - return the max value from the transformed array
=end

def delete_digit(int)
  digits = int.digits.reverse
  
  (0...digits.size).map do |skip_idx|
    digits.reject.with_index do |_, idx|
      skip_idx == idx
    end.join.to_i
  end.max
end

p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1
