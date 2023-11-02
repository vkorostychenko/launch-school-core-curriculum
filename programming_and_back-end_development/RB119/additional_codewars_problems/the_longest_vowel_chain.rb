=begin
The vowel substrings in the word codewarriors are o,e,a,io. The longest of these
has a length of 2. Given a lowercase string that has alphabetic characters only
(both vowels and consonants) and no spaces, return the length of the longest
vowel substring. Vowels are any of aeiou.

Input: a string
Output: an integer

Rules:
  Explicit:
    - given a lowercase string containing only alphabetic characters and no spaces
    - find the length of the longest vowel substring (vowels: aeiou)

Algorithm:
  - find all the substrings from the input string that contain only vowels
  - return the length of the longest substring
=end

def solve(str)
  str.scan(/[aeiou]+/).map(&:size).max
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8
