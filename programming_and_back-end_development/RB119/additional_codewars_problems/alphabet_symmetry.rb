=begin
Difficulty: medium

Consider the word "abode". We can see that the letter a is in position 1 and b
is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice
also that d and e in abode occupy the positions they would occupy in the alphabet,
which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy 
their positions in the alphabet for each word. 

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

Examples

solve(["abode","ABc","xyzD"]) = [4, 3, 1]

Input: an array
Output: a string

Rules:
  - given an array of words (alphabet characters up + low case, no spaces)
  - return an array of the number of letters that occupy their positions in the
    alphabet for each word

Algorithm:
  - given an array of strings
  - create an array of downcased alphabet letters (a-z)
  - iterate over the input array for transformation
    - iterate over each character and count only the one, which is at the same
      index in both the alphabet array and the current word
  - return the transformed array
=end

def solve(arr)
  alphabet = ('a'..'z').to_a

  arr.map do |word|
    word.chars.select.with_index do |char, idx|
      alphabet.index(char.downcase) == idx
    end.count
  end
end

p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]
