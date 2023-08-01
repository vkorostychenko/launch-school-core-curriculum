=begin
Given a string of words separated by spaces, write a method that takes this
string of words and returns a string in which the first and last letters of
every word are swapped.

You may assume that every word contains at least one letter, and that the string
will always contain at least one word. You may also assume that each string
contains nothing but words and spaces.

The PEDAC process

P: Understanding the Problem
  - Explicit requirements:
    - every word contains at least one letter
    - the string will always contain at least one word
    - each string contains nothing but words and spaces
    - Input: string
    - Output: string
      - in which the first and last letters of every word are swapped
  - Implicit requirements:
  - Questions:
    - Should this method return a new object or the original one?

E: Examples and Test Cases:
  - swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
  - swap('Abcde') == 'ebcdA'
  - swap('a') == 'a'
D: Data Structures:
A: Algorithms:
  - create an array where each element contains each word from the given string
    - iterate over an array of words distructively 
      - create a copy of word
      - reassign the first letter with index 0 to the last letter with index -1 
        from the original word
      - reassign the last letter with index -1 to the first letter with index 0
        from the original word
  - join all the words from an array together to create changed string and return it
=end

def swap(string)
  words = string.split.map do |word|
    word_copy = word.dup
    word_copy[0] = word[-1]
    word_copy[-1] = word[0]
    word_copy
  end
  words.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
