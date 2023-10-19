# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Examples:

# p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
#                 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# p to_weird_case(
#   'It is a long established fact that a reader will be distracted') ==
#   'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case('aaA bB c') == 'aaA bB c'
# p to_weird_case(
#   'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
#   'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".

=begin
Input: a string
Output: a modified string

Rules:
  - return a string with the same sequence of characters where:
    - every 2nd character in every third word converted to uppercase
    - other characters remain the same

Questions:
  - Should the method return a new string or modify the original one?

Algorithm:
  - Split the given string into separate words
  - Outer iterator will iterate through the array of words for transformation
    - If the word index is greater than 0 and is a multiple of 3 then:
      - modify every 2nd character
        - split the word into an array of characters
        - iterate over each character
          - if the character is odd, substitute it with its uppercase version
      - return modified word
    - else:
      - return word
  - Join the modified array with spaces and return it
=end

def to_weird_case(str)
  words = str.split

  words.map.with_index do |word, word_idx|
    if (word_idx + 1) > 0 && (word_idx + 1) % 3 == 0
      word.chars.each_with_index do |char, char_idx|
        char.upcase! if char_idx.odd?
      end.join
    else
      word
    end
  end.join(' ')
end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'
