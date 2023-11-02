=begin
Write a function that will return the count of distinct case-insensitive
alphabetic characters and numeric digits that occur more than once in the input
string. The input string can be assumed to contain only alphabets
(both uppercase and lowercase) and numeric digits.

Example
"abcde" -> 0 # no characters repeat more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice

input: a String
output: an Integer

Rules:
  - Explicit rules:
    - given a string containing only alphabets (both uppercase and lowercase)
      and numeric digits
    - count distinct alphabetic characters and numeric digits that
      occur more than once
    - return 0 if no characters repeat more than once

Algorithm:
  - initialise result to 0 
  - downcase the input string
  - convert it to an array of unique characters
  - iterate through the array
    - update the result if the current character appears in the
      input string downcased more than once
 - return result

=end

def duplicate_count(str)
  result = 0

  str.downcase.chars.uniq.each do |char|
    result += 1 if str.downcase.count(char) > 1
  end

  result
end

p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2
