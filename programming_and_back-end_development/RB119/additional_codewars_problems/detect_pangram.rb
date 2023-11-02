=begin
A pangram is a sentence that contains every single letter of the alphabet
at least once. For example, the sentence "The quick brown fox jumps over the
lazy dog" is a pangram, because it uses the letters A-Z at least once
(case is irrelevant).

Given a string, detect whether or not it is a pangram. Return True if it is,
False if not. Ignore numbers and punctuation.

Input: a string
Output: a boolean

Rules:
  - Explicit:
    - given a string
    - return true if it is a pangram (uses the letters A-Z at least once);
      otherwise false
    - case irrelevant
    - ignore numbers and punctuation

Algorithm:
  - create an array containing all alphabet letters downcased
  - iterate iterate over the array
    - return false if the input string doesn't match the current character 
      case insensitive
  - return true
=end

def pangram?(string)
  alphabet = ('a'..'z').to_a

  alphabet.all? do |letter|
    string.match?(/#{letter}+/i)
  end
end

p pangram?("The quick brown fox jumps over the lazy dog.") == true
p pangram?("This is not a pangram.") == false
