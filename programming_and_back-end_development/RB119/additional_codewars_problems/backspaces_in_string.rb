=begin
Difficulty: medium

Assume "#" is like a backspace in string. This means that string "a#bc#d" 
actually is "bd"

Your task is to process a string with "#" symbols.

Examples

  "abc#d##c"      ==>  "ac"
  "abc##d######"  ==>  ""
  "#######"       ==>  ""
  ""              ==>  ""

Input: a string
Output: a new string

Rules:
  - given a string
  - return the string processed by the given rules
    - delete the previous characters the number of times equal to the number
      of contiguous pound signs
    - return an empty string if the string is empty or it consists of only
      pound signs
    - return an empty string if the count of pound signs is greater than the
      number of letters

Algorithm:
  - given a string
  - create a variable result and set it to an empty string
  - iterate through each character
    - if the current character is a '#'
      - delete the last character from the result string destructively
    - otherwise, add the current character to the result string destructively
  - return the result
=end

def clean_string(str)
  str.chars.each_with_object('') do |char, result|
    char == '#' ? result.chop! : result << char
  end
end

p clean_string('abc#d##c')      == "ac"
p clean_string('abc####d##c#')  == ""
p clean_string("abc#d##c")      ==  "ac"
p clean_string("abc##d######")  ==  ""
p clean_string("#######")       ==  ""
p clean_string("")              ==  ""
