=begin
Difficulty: medium

A string is considered to be in title case if each word in the string is either 
(a) capitalized (that is, only the first letter of the word is in upper case) 
or (b) considered to be an exception and put entirely into lowercase unless it 
is the first word, which is always capitalized.

Write a function that will convert a string into the title case, given an optional 
list of exceptions (minor words). The list of minor words will be given as a 
string with each word separated by a space. Your function should ignore the 
case of the minor words string -- it should behave in the same way even if the 
case of the minor word string is changed.

Input: two strings
Output: a string

Rules:
  - given a string and an optional list of exceptions
  - convert a string into the title case where each word is considered to be
    capitalized except the ones that are included in the list of exceptions
  - words that are included in the list of exceptions must be downcased unless
    it is the first word in a sentence

Algorithm:
  - given two strings: a sentence and exceptions
  - reassign the sentence to its capitalized version
  - reassign the string of exceptions to its lowercase version split into an 
    array of words
  - split the sentence into words
    - iterate over each word for transformation
      - capitalize the current word if it is NOT included in the exceptions list
      - otherwise, keep it as it is
  - join the array of transformed words together with spaces and return it
=end

def title_case(title, minor_words = '')
  title = title.capitalize
  minor_words = minor_words.downcase.split

  title.split.map do |word|
    minor_words.include?(word) ? word : word.capitalize
  end.join(' ')
end

p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'
