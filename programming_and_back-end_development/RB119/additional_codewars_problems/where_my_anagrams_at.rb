=begin
Difficulty: medium

What is an anagram? Well, two words are anagrams of each other if they both contain 
the same letters. 

Write a function that will find all the anagrams of a word from a list. You will be 
given two inputs a word and an array with words. You should return an array of all 
the anagrams or an empty array if there are none.

For example:

  'abba' & 'baab' == true

  'abba' & 'bbaa' == true

  'abba' & 'abbba' == false

  'abba' & 'abca' == false

Input: a string and an array of strings
Output: an array

Rules:
  - given a string and an array of strings
  - select from the given array all the strings that are anagrams to the given string if there are any

Algorithm:
  - given a word and an array of word
  - iterate through the given array of words for selection
    - convert the given word into an array and sort it
    - convert the current word into an array and sort it
    - select the current word if they are the same
=end

def anagrams(word, arr)
  arr.select do |current_word|
    word.chars.sort == current_word.chars.sort
  end
end

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']
p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']
p anagrams('laser', ['lazing', 'lazy',  'lacer']) == []
