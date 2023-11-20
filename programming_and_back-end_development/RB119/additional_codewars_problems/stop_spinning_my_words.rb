=begin
Difficulty: medium

Write a function that takes in a string of one or more words, and returns the 
same string, but with all five or more letter words reversed (Just like the 
name of this Kata). Strings passed in will consist of only letters and spaces. 
Spaces will be included only when more than one word is present.

Example: 
spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"

Input: a string
Output: same string modified

Rules:
  - given a string of one or more words
    - string will consist of only letters and spaces
  - return the same string, but with all five or more letter words reversed

Algorithm:
  - given a string
  - split the string into an array of words
    - iterate over the array for transformation
      - if the length of the current word is equal OR greater than 5
        - reverse the word
      - otherwise keep the word unchanged
  - join the modified array with spaces to a string
  - replace the content of the input string with the content of the modified
    string
=end

def spin_words(str)
  temp_str = str.split.map do |word|
    word.size >= 5 ? word.reverse : word
  end.join(' ')
  
  str.replace(temp_str)
end

p spin_words("Hey fellow warriors") == "Hey wollef sroirraw"
p spin_words("This is a test") == "This is a test" 
p spin_words("This is another test") == "This is rehtona test"
p spin_words('test') == 'test'
