# Anagrams

# Write a program that takes a word and a list of possible anagrams and selects
# the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists",
# "google", "inlets", and "banana", the program should return a list containing "inlets".
# Please read the test suite for the exact rules of anagrams.

=begin
Requirements:

  - equal words are not anagrams
  - case insensitive
  - keep case when a word is selected

=end

class Anagram
  def initialize(word)
    @word = word
  end

  def match(list)
    list.select do |anagram|
      next if @word.downcase == anagram.downcase
      @word.downcase.chars.sort == anagram.downcase.chars.sort
    end
  end
end
