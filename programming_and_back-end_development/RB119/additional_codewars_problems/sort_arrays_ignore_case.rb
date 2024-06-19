=begin
Difficulty: ___

Sort the given strings in alphabetical order, case insensitive. 

For example:

["Hello", "there", "I'm", "fine"]  -->  ["fine", "Hello", "I'm", "there"]
["C", "d", "a", "B"])              -->  ["a", "B", "C", "d"]

Input: an array
Output: a new array

Rules:
  - given an array
  - sort the array by the first letter of the word (case insensitive) and return it

Algorithm:
  - given an array of strings
  - iterate through the array for transformation
    - sort by the first letter case insensitive
  - return the transformed array
=end

def sortme(arr)
  arr.sort_by { |word| word[0].downcase }
end

p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]
p sortme(["C", "d", "a", "Ba", "be"]) == ["a", "Ba", "be", "C", "d"]
p sortme(["CodeWars"]) == ["CodeWars"]
