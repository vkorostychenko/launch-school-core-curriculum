=begin
Given two words, how many letters do you have to remove from them to make them anagrams?
  Example
  First word : c [O] [D] e [W] a r [S] (4 letters removed)
  Second word : [H] [A] c [K] e [R] r a [N] [K] (6 letters removed)
  Result : 10
  Hints
  A word is an anagram of another word if they have the same letters (usually in a different order).
  Do not worry about case. All inputs will be lowercase.

Input: two strings
Output: an integer

Rules:
  - given two strings
  - return a count of letters that needs to be removed to create an anagram

Algorithm:
  - given two strings
  - convert the first word into an array of characters and interate through
    - if the current character is in both strings
      - destructively substitute the first instance of it on both strings
  - retrurn the sum of the count of this strings
=end


def anagram_difference(str1, str2)
  str1.chars.each do |char|
    if str1.include?(char) && str2.include?(char)
      str1.sub!(char, '')
      str2.sub!(char, '')
    end
  end

  str1.size + str2.size
end

p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10
