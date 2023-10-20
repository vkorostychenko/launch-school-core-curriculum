# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase versions to be the same.

# Examples:

# p least_common_char("Hello World") #== "h"
# p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
# p least_common_char("Mississippi") #== "m"
# p least_common_char("Happy birthday!") #== ' '
# p least_common_char("aaaaaAAAA") #== 'a'

# The tests above should print "true".

=begin
Input: a string
Output: a string, containing a single character

Rules:
  - return a character that occurs least often in the input string
  - if there are multiple characters with the equal least number of occurrences,
    then return the first one
  - consider the uppercase and lowercase versions to be the same

Algorithm:
  - create a copy of the input string with all letters downcased
  - create an array of unique downcased characters
  - create a hash to store all character-occurrence pairs
  - iterate over an array of unique downcased characters
    - assign the current character as a key and its occurrence as a value in
      character-occurrence hash
  - reference all the values of character-occurrence hash
    - find a minimum value
  return the first key referencing the minimum value
=end

def least_common_char(str)
  str = str.downcase
  unique_characters = str.chars.uniq
  character_occurrence = {}

  unique_characters.each do |chr|
    character_occurrence[chr] = str.count(chr)
  end

  min_occurrence = character_occurrence.values.min

  character_occurrence.key(min_occurrence)
end

p least_common_char("Hello World") == "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
p least_common_char("Mississippi") == "m"
p least_common_char("Happy birthday!") == ' '
p least_common_char("aaaaaAAAA") == 'a'
