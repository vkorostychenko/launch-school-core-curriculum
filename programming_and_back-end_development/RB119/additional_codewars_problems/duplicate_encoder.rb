=begin
Difficulty: hard

The goal of this exercise is to convert a string to a new string where each 
character in the new string is "(" if that character appears only once in the 
original string, or ")" if that character appears more than once in the original 
string. Ignore capitalization when determining if a character is a duplicate.

Examples

  "din"      =>  "((("
  "recede"   =>  "()()()"
  "Success"  =>  ")())())"
  "(( @"     =>  "))((" 

Input: a string
Output: a string

Rules:
  - given a string
  - convert the string into a new string where each character in the new string:
    - '(' if that character appears only once
    - ')' if that character appears more than once
  - ignore the case

Algorithm:
  - given a string
  - create a downcased copy of the input string
  - split the copy into an array of characters
  - iterate over the array of characters for transformation
    - count the current character in the copy string
    - if the count is 1 then '('
    - otherwise ')'
  - join the transformed array into a string and return it
=end

def duplicate_encode(str)
  str = str.downcase

  str.chars.map { |char| str.count(char) == 1 ? '(' : ')' }.join
end

p duplicate_encode("din") == "((("
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))(("
