=begin
Modify the word_sizes method from the previous exercise to exclude non-letters
when determining word size. For instance, the length of "it's" is 3, not 4.

The PEDAC process

P: Understanding the Problem
  - Explicit requirements:
    - Input: string
    - Output: hash
  - Implicit requirements:
    - empty string returns an empty hash
  - Questions:

E: Examples and Test Cases:
  - word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
  - word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
  - word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
  - word_sizes('') == {}
D: Data Structures:
A: Algorithms:
  - create an empty 'result' hash
  - create an array of splitted words
    - iterate over the array
      - count only alphabetical letters, both lowercase and uppercase
      - add to the 'result' hash the number as a key and 1 as a value
      - increment the value by 1 if a key already exists
  - return the 'result' hash
=end

def word_sizes(string)
  result = Hash.new(0)
  string.split.each do |word|
    result[word.count("a-zA-Z")] += 1
  end
  result
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}
