=begin
Given a string that consists of some words (all lowercased) and an assortment of
non-alphabetic characters, write a method that returns that string with all of
the non-alphabetic characters replaced by spaces. If one or more non-alphabetic
characters occur in a row, you should only have one space in the result
(the result should never have consecutive spaces).

The PEDAC process

P: Understanding the Problem
  - Explicit requirements:
    - replace all of the non-alphabetic characters by spaces
    - the result should never have consecutive spaces
    - Input: string
    - Output: string
  - Implicit requirements:
  - Questions:
    - Should this method return a new object or the original one?

E: Examples and Test Cases:
  - cleanup("---what's my +*& line?") == ' what s my line '
D: Data Structures:
A: Algorithms:
=end

def cleanup(string)
  string.gsub(/[^a-z]/, ' ').squeeze
end

p cleanup("---what's my +*& line?") == ' what s my line '
