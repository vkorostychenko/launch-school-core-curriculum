=begin
Difficulty: ___

Mothers arranged a dance party for the children in school. At that party, 
there are only mothers and their children. All are having great fun on the 
dance floor when suddenly all the lights went out. It's a dark night and no one 
can see each other. But you were flying nearby and you can see in the dark and 
have ability to teleport people anywhere you want.

Legend:

  -Uppercase letters stands for mothers, lowercase stand for their children, i.e. "A" mother's children are "aaaa".
  -Function input: String contains only letters, uppercase letters are unique.

Task:

Place all people in alphabetical order where Mothers are followed by their children, i.e. "aAbaBb" => "AaaBbb".

Input: a string
Output: a new string

Rules:
  - given a string
  - return a sorted copy of a string

Algorithm:
  - given a string
  - create an array of uppercased letters from the input string
  - sort the array
  - iterate through the array for transformation
    - count the lowercased version of the current letter in the input str
    - add the lowercased letter count times to the current upcased letter
  - join the array of strings together to a result string

=end

def find_children(str)
  str.chars.sort_by{ |char| [char.downcase, char] }.join
end

p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""
