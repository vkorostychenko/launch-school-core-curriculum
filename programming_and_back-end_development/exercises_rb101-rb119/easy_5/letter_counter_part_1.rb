=begin
Write a method that takes a string with one or more space separated words and
returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

The PEDAC process

P: Understanding the Problem
  - Explicit requirements:
    - Input: string
    - Output: hash
  - Implicit requirements:
    - empty string returns an empty hash
  - Questions:

E: Examples and Test Cases:
  - word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
  - word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
  - word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
  - word_sizes('') == {}
D: Data Structures:
A: Algorithms:
  - create an empty result hash
  - crate an array of splitted words from string
    - iterate over an array of words
      - replace each word to its length
  - iterate over an array of unique lengths
    - count each occurrence of length in lenths
    - add each length in the result hash as a key with the value of
      number of its occurrence in lengths array
  - return the result hash
=end

def word_sizes(string)
  result = {}
  sizes = string.split.map(&:size)
  sizes.uniq.each do |size|
    result[size] = sizes.count(size)
  end
  result
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
