=begin
Difficulty: medium

You will be given a number and you will need to return it as a string in 
Expanded Form. 

Examples

expanded_form(12); # Should return '10 + 2'
expanded_form(42); # Should return '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'

NOTE: All numbers will be whole numbers greater than 0.

Input: an integer
Output: a string

Rules:
  - given an integer
  - return the number in an expanded form as a string like this 12 -> '10 + 2'

Examples:

70304

7 + 0000 = 70000
0 - skip 
3 + 00   = 300
0 - skip
4        = 4

'70000 + 300 + 4'

Algorithm:
  - given a number
  - create an array of digits (strings) of the given number
  - find the size of the array of digits and assign it to a variable
  - iterate through the array of digits for transformation with index
    - if the current number is > 0
      - add the current digit (string) to the result of multiplying '0' by the
        size of the array - current index + 0
  - select elements that are greater than 0 (convert to an integer for comparison)
  - join the array of selected strings with ' + ' and return a string
=end


def expanded_form(int)
  digits = int.to_s.chars
  size = digits.size

  digits.map!.with_index do |digit, index|
    if digit.to_i > 0
      digit + '0' * (size - (index + 1))
    end
  end

  digits.select { |str_num| str_num.to_i > 0 }.join(' + ')
end

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'
