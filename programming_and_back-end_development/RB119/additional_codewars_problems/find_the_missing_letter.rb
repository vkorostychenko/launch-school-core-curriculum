=begin
Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.

You will always get an valid array. And it will be always exactly one letter be missing. The length of the array will always be at least 2.
The array will always contain letters in only one case.

Example:

['a','b','c','d','f'] -> 'e'
['O','Q','R','S'] -> 'P'

["a","b","c","d","f"] -> "e"
["O","Q","R","S"] -> "P"
(Use the English alphabet with 26 letters!)

Have fun coding it and please don't forget to vote and rank this kata! :-)

I have also created other katas. Take a look if you enjoyed this kata!

Input: an array
Output: a string

Rules:
  - given an array of English letters (all a-z or A-Z)
  - return the letter that is missing from the sequence of the alphabet letters

Algorithm:
  - given an array of letters
  - create a reference array as a range from the first up to the last character
    from the input array
  - subtract the input array from the reference array
  - return the first element
=end


def find_missing_letter(arr)
  ((arr.first..arr.last).to_a - arr).first
end

p find_missing_letter(["a","b","c","d","f"]) == "e"
p find_missing_letter(["O","Q","R","S"]) == "P"
p find_missing_letter(["b","d"]) == "c"
p find_missing_letter(["a","b","d"]) == "c"
p find_missing_letter(["b","d","e"]) == "c"
