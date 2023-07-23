=begin
Write a method that determines and returns the ASCII string value of a string
that is passed in as an argument. The ASCII string value is the sum of the ASCII
values of every character in the string.
(You may use String#ord to determine the ASCII value of a character.)

The PEDAC process

P: Understanding the problem
  - Explicit requirements:
    - Input: string
    - Output: integer
    - determine the sum of the ASCII values of each character
  - Implicit requirements:
    - return 0 if the string is empty
  - Questions:
    - n/a

E: Examples and Test Cases:
  - ascii_value('Four score') == 984
  - ascii_value('Launch School') == 1251
  - ascii_value('a') == 97
  - ascii_value('') == 0
D: Data Structures:
A: Algorithms
  - convert string to an array containing all of the characters as a separate element 
  - transform created array converting each character to its ASCII representation
  - return the sum of elements of the transformed array
=end

def ascii_value(string)
  string.chars.map { |chr| chr.ord }.sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
