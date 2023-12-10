=begin
Difficulty: easy

An anagram is the result of rearranging the letters of a word to produce a 
new word (see wikipedia).

Note: anagrams are case insensitive

Complete the function to return true if the two arguments given are anagrams 
of each other; return false otherwise.

Examples

  "foefet" is an anagram of "toffee"

  "Buckethead" is an anagram of "DeathCubeK"

Input: two strings
Output: a boolean

Rules:
  - given two stringrs
  - return true if they are anagrams

Algorithm:
  - given two strings
  - downcase both strings
  - sum the position of each character in ASCII table
  - return true if sums are the same
=end

def is_anagram(str1, str2)
  str1.downcase.sum == str2.downcase.sum
end

p is_anagram('Creative', 'Reactive') == true
p is_anagram("foefet", "toffee") == true
p is_anagram("Buckethead", "DeathCubeK") == true
p is_anagram("Twoo", "WooT") == true
p is_anagram("dumble", "bumble") == false
p is_anagram("ound", "round") == false
p is_anagram("apple", "pale") == false
