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
  - create an array of digits of the given number
  - iterate through the array of digits for transformation with index
    - multiply the current digit by 10 in the power of the current index
  - select elements that are greater than 0
  - join the array of selected numbers with ' + ' and return a string
=end

def expanded_form(num)
  num.digits.map.with_index do |digit, idx|
    digit * (10**idx)
  end.reject(&:zero?).reverse.join(' + ')
end

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'
