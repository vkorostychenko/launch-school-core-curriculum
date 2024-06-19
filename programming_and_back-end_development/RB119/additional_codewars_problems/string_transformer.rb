=begin
Given a string, return a new string that has transformed based on the input:

Change case of every character, ie. lower case to upper case, upper case to lower case.
Reverse the order of words from the input.
Note: You will have to handle multiple spaces, and leading/trailing spaces.

For example:

"Example Input" ==> "iNPUT eXAMPLE"
You may assume the input only contain English alphabet and spaces.

Input: a string
Output: a new string

Rules:
  - given a string (a-z A-Z ' ')
  - return a copy of the string
    - swap case
    - reverse words and spaces

Examples:

"    A b  C   "  -> "   c  B a    "
spaces ["    ", " ", "  ", "   "] 
words  ["A", "b", "C"]

' string' -> 'STRING '
spaces [' ']
words  ['string']

'string ' -> ' STRING'
spaces [' ']
words  ['string']

Algorithm:
  - given a string
  - iterate through the input string to create an array of spaces
  - iterate through the input string to create an array of letters
  - iterate through the array of words for transformation
    - swap case each word
  - create a local variable result and set to an empty string
  - create a local variable is_space
    - reference the first element the input string
    - if the element is a space
      - set the variable to true
    - otherwise set it to false

  - while spaces and words are not empty
    - if is_space is true
      - pop the last element from the array of spaces
      - append the element to the result string
      - pop the last element from the array of words
      - append the element to the result string
    - else
      - pop the last element from the array of words
      - append the element to the result string
      - pop the last element from the array of spaces
      - append the element to the result string
    - end

  - return the result string
=end


# def string_transformer(str)
#   spaces = str.scan(/[ ]+/)
#   words = str.scan(/[a-z]+/i).map(&:swapcase)
#   result = ''

#   str[0] == ' ' ? is_space = true : is_space = false

#   until spaces.empty? && words.empty?
#     if is_space == true
#       result << spaces.pop if !spaces.empty?
#       result << words.pop if !words.empty?
#     else
#       result << words.pop if !words.empty?
#       result << spaces.pop if !spaces.empty?
#     end
#   end

#   result
# end

=begin
EXAMPLE

INPUT               OUTPUT
'Example string' => 'STRING eXAMPLE'

"gnirts elpmaxE" => get array of words 

REF => ["gnirts", "elpmaxE"]
FIX => ["Example", "string"]



INPUT              OUTPUT
"    A b  C   " => "   c  B a    "

"   C  b A    "

REF => ['C', 'b', 'A']
FIX => ['A', 'b', 'C']

ALGORITHM
- Given a string
- Reverse the string to swap and take care of all the spaces
- Get an array of all the words (use this array for REF)
- Get a new array from REF array and reverse each word
- Iterate through the REF array with index
  - Find curr word in the given string replace it with new word from FIX array
    at same index
- Return the string
=end

def string_transformer(str)
  fixed_str = str.reverse

  ref_words = fixed_str.split
  fix_words = ref_words.map(&:reverse)

  ref_words.each_with_index do |word, idx|
    fixed_str.sub!(word, fix_words[idx].swapcase)
  end

    fixed_str
end

p string_transformer('Example string') == 'STRING eXAMPLE'
p string_transformer(' string') == 'STRING '
p string_transformer("    A b  C   ") == "   c  B a    "
p string_transformer("A b  C   ") == "   c  B a"
p string_transformer("    A b  C") == "c  B a    "

# it was reeeeaaaalllyy HARD