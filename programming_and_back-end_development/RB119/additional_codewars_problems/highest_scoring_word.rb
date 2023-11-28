=begin
Difficulty: easy

Given a string of words, you need to find the highest-scoring word.

Each letter of a word scores points according to its position in 
the alphabet: a = 1, b = 2, c = 3 etc.

You need to return the highest-scoring word as a string.

If two words score the same, return the word that appears earliest in
the original string.

All letters will be lowercase and all inputs will be valid.

Input: a string
Output: a string

Rules:
  - given a string
  - find the highest-scoring word and return it
    - as a sum of the position of the letter in the alphabet
  - all letters will be lowercase and all inputs will be valid
  - if two words score the same, return the word that appears earliest in
    the original string

Algorithm:
  - given a string
  - create a reference hash of alphabet letters as keys and their positions
    as values
  - split the input string into an array of words
  - iterate through the array of words to find the highest score
    - split the current word into an array of characters
    - iterate over each character and sum up
      - reference a value in the alphabet hash that the current character at
  - return the word which sum is the greatest
=end

def high(text)
  alphabet = ('a'..'z').zip((1..26)).to_h

  text.split.max_by do |word|
    word.chars.sum { |char| alphabet[char] }
  end
end

p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aaa b') == 'aaa'
