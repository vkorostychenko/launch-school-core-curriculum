=begin
Complete the greatestProduct method so that it'll find the greatest product of
five consecutive digits in the given string of digits.

For example:

greatestProduct("123834539327238239583") // should return 3240

The input string always has more than five digits.

Adapted from Project Euler.

Input: a string
Output: a number

Rules:
  - given a string of digits
  - find the greatest product of five consecutive digits in the given string and
    return it
  - the input string always has more than five digits

Algorithm:
  - given a string
  - transform the string into an array of digits
  - initialize the local variable max_product to 0
  - iterate from 0 up to the length of the array of digits - 5
    - take 5 digits starting from the current index
    - find the product
    - reassign the max_product to the current product if the current product is
      greater than max_product

  return max_product
=end

def greatest_product(n)
  digits = n.chars.map(&:to_i)
  max_product = 0

  0.upto(digits.size - 5) do |idx|
    product = digits[idx, 5].reduce(:*)

    max_product = product if product > max_product
  end

  max_product
end

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0
