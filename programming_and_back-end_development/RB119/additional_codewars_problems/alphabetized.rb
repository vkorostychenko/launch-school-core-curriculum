=begin
Difficulty: medium

Re-order the characters of a string, so that they are concatenated into a new 
string in "case-insensitively-alphabetical-order-of-appearance" order. 
Whitespace and punctuation shall simply be removed!

The input is restricted to contain no numerals and only words containing the 
english alphabet letters.

Example:

alphabetized("The Holy Bible") # "BbeehHilloTy"

Input: a string
Output: a string

Rules:
  - given a string
  - return a new string sorted ("case-insensitively-alphabetical-order-of-appearance")

Algorithm:
  - given a string
  - create a copy of a string and delete everything except a-z A-Z
  - create an array of alphabet letters a-z
  - iterate through the alphabet with the result string object
    - create an array containing all instances of the current letter
    - join the elements of the array together to a string
    - append the string to the result
  - return the result string
=end

def alphabetized(str)
  str = str.gsub(/[^a-z]/i, '')

  ('a'..'z').each_with_object('') do |letter, result|
    result << str.scan(/#{letter}/i).join
  end
end

p alphabetized("") == ""
p alphabetized(" ") == ""
p alphabetized(" a") == "a"
p alphabetized("a ") == "a"
p alphabetized(" a ") == "a"
p alphabetized("A b B a") == "AabB"
p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"
p alphabetized("!@$%^&*()_+=-`,") == ""
p alphabetized("The Holy Bible") == "BbeehHilloTy"
p alphabetized("CodeWars can't Load Today") == "aaaaCcdddeLnooorstTWy"
