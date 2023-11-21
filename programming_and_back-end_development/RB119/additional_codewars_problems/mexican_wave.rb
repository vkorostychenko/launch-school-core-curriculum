=begin
Difficulty: hard

In this simple Kata your task is to create a function that turns a string into a 
Mexican Wave. You will be passed a string and you must return that string in an 
array where an uppercase letter is a person standing up.

Rules
 	1.  The input string will always be lower case but maybe empty.
  2.  If the character in the string is whitespace then pass over it as if it was an empty seat.

Input: a string
Output: an array

Rules:
  - given a string (always lowercase, but might be empty)
  - return an array containing copies of the given string with one letter
    uppercased

Algorithm:
  - given a string
  - initialize a local variable result to an empty array
  - iterate over each index of the input string
    - if the character at the current index in the input string is a letter
      - create a downcased copy of the input string and substitute the character
        at the current index with its uppercased version
    - append the string to the result array
  - return result array
=end

def wave(str)
  result = []

  0.upto(str.size - 1) do |idx|
    if str[idx].match?(/[a-z]/i)
      current_str = str.downcase
      current_str[idx] = current_str[idx].upcase

      result << current_str
    end
  end

  result
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]
