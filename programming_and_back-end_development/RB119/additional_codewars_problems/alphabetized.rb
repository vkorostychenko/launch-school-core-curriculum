=begin
Difficulty: medium

Re-order the characters of a string, so that they are concatenated into a new 
string in "case-insensitively-alphabetical-order-of-appearance" order. 
Whitespace and punctuation shall simply be removed!

The input is restricted to contain no numerals and only words containing the 
English alphabet letters.

Example:

alphabetized("The Holy Bible") # "BbeehHilloTy"

Input: a string
Output: a string

Rules:
  - given a string
  - return a new string sorted ("case-insensitively-alphabetical-order-of-appearance")

Algorithm:
  - given a string
  - create an array of letters (a-z A-Z)
  - sort the array of letters by their lowercase version
  - join an array of letters together to a string and return it
=end

def alphabetized(str)
  str.scan(/[a-z]/i).sort_by(&:downcase).join
end

p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a") == "AabB"
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
