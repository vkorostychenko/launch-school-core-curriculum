=begin
Complete the function scramble(str1, str2) that returns true if a portion of
str1 characters can be rearranged to match str2, otherwise returns false.

Notes:
Only lowercase letters will be used (a-z). No punctuation or digits will be
included.
Performance needs to be considered.

Examples
scramble('rkqodlw', 'world') ==> True
scramble('cedewaraaossoqqyt', 'codewars') ==> True
scramble('katas', 'steak') ==> False

Input: two strings
Output: a boolean

Rules:
  - Explicit:
    - given two strings in lowercase letters, no punctuation or digits
    - return true if a portion of str1 characters can be rearranged to match
      str2, otherwise return false

Algorithm:
  - return false if str1 is shorter than str2
  - iterate through the unique characters of the str2
    - count the current character in both strings
    - if the count in string 1 is less than the count in string 2, return false
  - return true
=end

def scramble(str1,str2)
  return false if str1.size < str2.size
  
  str2.chars.uniq.none? { |char| str1.count(char) < str2.count(char) }
end

p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true
