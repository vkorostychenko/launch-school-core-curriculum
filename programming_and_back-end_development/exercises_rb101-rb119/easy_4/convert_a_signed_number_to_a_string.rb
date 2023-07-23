=begin
Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby,
such as Integer#to_s, String(), Kernel#format, etc. You may, however, use
integer_to_string from the previous exercise.

The PEDAC process

P: Understanding the Problem
  - Explicit requirements:
    - Input: integer
    - Output: string
    - convert an integer to its string representation

  - Implicit requirements:
    - add a sign to its string representation ('+' or '-')
    - when a number is 0 add no sign
    
  - Questions:
    - n/a

E: Examples and Test Cases
  - signed_integer_to_string(4321) == '+4321'
  - signed_integer_to_string(-123) == '-123'
  - signed_integer_to_string(0) == '0'

D: Data Structures

A: Algorithms
  - initialise a constant 'DIGITS' to reference an array of string representations of numbers '0'-'9'
  - integer_to_string method
    - initialise a local variable 'result' to an empty string
    - initialise a local variable 'sign' to an empty string
    - begin a conditional
      - if 'number' is positive then append '+' to 'sign'
      - else if 'number' is negative then append '-' to 'sign'
        - reassign the local variable 'number' to 'number' multiplied by (-1)
      - end
    - begin a loop
      - using modulo division, extract the last decimal from the 'number'
      - initialise local variable 'reminder' to this decimal
      - reassing the local variable 'number' to the 'number' divided by 10
      - prepend 'result' by the element of the 'DIGITS' array which reference by the 'reminder' index
      - break out of the loop when 'number' is equals to 0
    - prepend 'sign' to 'result'
    - return 'result'
  
=end

DIGITS = ('0'..'9').to_a

def signed_integer_to_string(number)
  result = ''
  sign = ''

  if number.positive?
    sign << '+'
  elsif number.negative?
    sign << '-'
    number = number * (-1)
  end

  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  
  result.prepend(sign)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
