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
  - initialize the local variable result to an empty array
  - iterate from 0 up to the length of the input string -1 with the step = 2
    - take two elements starting from the current index from the input string
    - if their length is NOT equal to 2
      - append '_'
    - append the substring into the result array
  - return result array
=end

def solution(str)
  result = []

  (0...str.size).step(2) do |start_idx|
    substr = str[start_idx, 2]

    substr.size == 2 ? result << substr : result << substr + '_'
  end

  result
end

p solution('abc') == ['ab', 'c_']
p solution('abcdef') == ['ab', 'cd', 'ef']
p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") == []
