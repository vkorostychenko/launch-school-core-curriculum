=begin
Difficulty: medium

Complete the solution so that it splits the string into pairs of two characters. 
If the string contains an odd number of characters then it should replace the 
missing second character of the final pair with an underscore ('_').

Input: a string
Output: an array

Rules:
  - given a string
  - split the string into an array of two characters
    - if the string contains an odd number of characters then it should replace
      the missing second character of the final pair with an underscore '_'

Algorithm:
  - given a string
  - append '_' to the input string if its length is odd
  - initialize the result array
  - iterate over the string
    - slice the string into the substrings of the length of 2
    - append substrings into the result array
  - return the result array
=end

def solution(str)
  str = str + '_' if str.size.odd?

  str.scan(/\w{2}/)
end

p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []
