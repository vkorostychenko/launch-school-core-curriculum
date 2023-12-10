=begin
Difficulty: medium

Write a method that takes a string as an argument and groups the number of 
times each character appears in the string as a hash sorted by the highest 
number of occurrences.

The characters should be sorted alphabetically e.g:

get_char_count("cba") => {1=>["a", "b", "c"]}

You should ignore spaces, and special characters and count uppercase letters
as lowercase ones.

Input: a string
Output: a hash

Rules:
  - given a string
  - count a-z and numbers and group them into a hash by the number of their occurrences
  - the characters within the hash should be sorted aplhabetically
  - sort the output hash from the highest to the lowest

Algorithm:
  - given a string
  - downcase the string
  - create an array of unique characters (a-z0-9)
  - iterate through the array of unique characters with an object (empty hash)
    - count the downcased current character in the input string
    - if the key with the current count number exists
      - object[key] << current character
    - else create a key-value pair, where the current count is a key and the
      current character is an element of an array
  - return the result hash sorted by the key in descending order
=end

def get_char_count(str)
  unique_chars = str.downcase.scan(/[a-z0-9]/i).uniq.sort

  unique_chars.each_with_object({}) do |char, result|
    count = str.downcase.count(char)

    result.key?(count) ? result[count] << char : result[count] = [char]
  end.sort_by { |key, value| -key }.to_h
end

p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}
