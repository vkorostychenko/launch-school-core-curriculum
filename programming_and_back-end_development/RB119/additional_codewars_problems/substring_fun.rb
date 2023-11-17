=begin
Difficulty: medium

You must concatenate the nth letter from each word to construct a new word which
should be returned as a string, where n is the position of the word in the list.

Example:

["yoda", "best", "has"]  -->  "yes"
  ^        ^        ^
  n=0     n=1     n=2

Note: Test cases contain valid input only 
i.e. a string array or an empty array; and each word will have enough letters.

Input: an array
Output: a string

Rules:
  - given an array of strings
    - the input will always be valid
  - construct a new word by concatenating the nth letter from each word that is
    at the n position of the word in the list and return it

Algorithm:
  - given an array
  - iterate over the input array for transformation with index
    - reference the character at the current index in the current word
  - join the transformed array elements to create a string and return it
=end

def nth_char(arr)
  arr.map.with_index { |word, idx| word[idx] }.join
end

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars'
