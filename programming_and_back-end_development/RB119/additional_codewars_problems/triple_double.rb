=begin
Difficulty: ___

Write a function triple_double(num1, num2) which takes numbers num1 and num2 and 
returns 1 if there is a straight triple of a number at any place in num1 and also 
a straight double of the same number in num2.

If this isn't the case, return 0

Examples

triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and  num2 has straight double 99s

triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2

Input: two integers
Output: an integer

Rules:
  - given two integers
  - return an integer 0 or 1
    - 1, when there is a triple in num1 and a double in the num2 of the same integer
    - 0, otherwise

Algorithm:
  - given two integers
  - iterate through a string representation of digits from '0' to '9'
    - initialize a local variable triple to the current digit string multiplied by 3
    - initialize a local variable double to the current digit string multiplied by 2
    - if a string representation of the num1 includes triple AND
         a string representation of the num2 includes double
      - return 1
    - otherwise, return 0

=end

def triple_double(num1, num2)
  ('0'..'9').each do |digit|
    triple = digit * 3
    double = digit * 2

    return 1 if num1.to_s.include?(triple) && num2.to_s.include?(double)
  end

  return 0
end

p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1
p triple_double(66789, 12345667) == 0
p triple_double(451999277, 41177722899) == 1
p triple_double(1222345, 12345) == 0
p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1
p triple_double(10560002, 100) == 1
p triple_double(1112, 122) == 0
