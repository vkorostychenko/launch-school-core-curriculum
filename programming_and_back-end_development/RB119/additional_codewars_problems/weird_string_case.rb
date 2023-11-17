=begin
Write a function that accepts a string, and returns the same string with all
even indexed characters in each word uppercased, and all odd indexed characters
in each word in lowercase. The indexing just explained is zero based, so the
  zero-ith index is even, therefore that character should be uppercased and you
  need to start over for each word.

The passed-in string will only consist of alphabetical characters and
spaces(' '). Spaces will only be present if there are multiple words. Words will
be separated by a single space(' ').
Examples:

"String" => "StRiNg"
"Weird string case" => "WeIrD StRiNg CaSe"

Input: a string
Output: a transformed string

Rules:
  - given a string containing only alphabetical characters and spaces
  - return the same (mutated) string with all even indexed characters in each
    word lowercased

Algorithm:
  - given a string
  - split the string into an array of words and iterate through it for
    transformation
    - iterate over each character of the current word for transformation with
      index
    - uppercase the current character if the index is even
  - join the transformed array of words together with spaces
  - replace the input string with the content of the modified string and return it
=end

def weirdcase(str)
  temp_str = str.split.map do |word|
    word.chars.map.with_index do |char, idx|
      idx.even? ? char.upcase : char
    end.join
  end.join(' ')

  str.replace(temp_str)
end

p weirdcase('This') == 'ThIs'
p weirdcase('is') == 'Is'
p weirdcase('This is a test') == 'ThIs Is A TeSt'
