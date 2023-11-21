=begin
Difficulty: medium

In this kata you are required to, given a string, replace every letter with its 
position in the alphabet.

"a" = 1, "b" = 2, etc.

If anything in the text isn't a letter, ignore it and don't return it.


Example

alphabet_position("The sunset sets at twelve o' clock.")
Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)

Input: a string
Output: a string

Rules:
  - given a string
  - replace every letter with its position in the alphabet
  - ignore everything that is NOT a letter

Algorithm:
  - given a string
  - initialize a local variable alphabet to an array of all alphabet characters
  - reassign the input string to its lowercase version and delete everything that
    is NOT a letter
  - convert the string into an array of characters and iterate over for
    transformation
    - find the index in the alphabet that the current character is and
      increment it by 1, this is the criteria for transformation
  - join the transformed array with spaces and return it
=end

def alphabet_position(text)
  alphabet = ('a'..'z').to_a

  text.downcase.scan(/[a-z]/).map do |letter|
    alphabet.index(letter) + 1
  end.join(' ')
end

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""
