=begin
Write function scramble(str1, str2) that returns true if a portion of str1
characters can be rearranged to match str2, otherwise returns false.

For example:
str1 is 'rkqodlw' and str2 is 'world' the output should return true.
str1 is 'cedewaraaossoqqyt' and str2 is 'codewars' should return true.
str1 is 'katas' and str2 is 'steak' should return false.

Only lower case letters will be used (a-z). No punctuation or digits will be
included.
=end

=begin
Input: two strings
Output: a boolean

Rules:
  - return true if a portion of str1 characters can be rearranged to match str2
  - consider only lowercase letters
  - no punctuation or digits will be included

Algorithm:
  - iterate over str2
    - count the current character in both str1 and str2
    - return false if the number of characters in str1 is less than in str2
  - return true
=end

def scramble(str1, str2)
  str2.each_char do |char|
    return false if str1.count(char) < str2.count(char)
  end

  true
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true
