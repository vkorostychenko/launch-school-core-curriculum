=begin
Difficulty: ___

You are given a secret message you need to decipher. Here are the things you need 
to know to decipher it:

For each word:

- The second and the last letter is switched (e.g. Hello becomes Holle)
- The first letter is replaced by its character code (e.g. H becomes 72)

Note: there are no special characters used, only letters and spaces

Examples

decipherThis('72olle 103doo 100ya'); # => 'Hello good day'
decipherThis('82yade 115te 103o');   # => 'Ready set go'

Input: a string
Output: a new string

Rules:
  - given a string
  - return a deciphered copy of the string
  - consider only letters and spaces

Algorithm:
  - given a string
  - split the string into an array of words
  - iterate through the array of words for transformation
    - split the current word into an array containing a number and letters as separate elements
    - reassign the element at index 0 to itself but converterted to an integer and then to character
    - swap the element at index 1 with the last element
    - join the characters together into a string
  - return the transformed array converted to a string
=end

def decipher_this(text)
  text.split.map do |word|
    arr_word = word.scan(/[0-9]+|[a-z]/i)
    arr_word[0] = arr_word[0].to_i.chr
    arr_word[1], arr_word[-1] = arr_word[-1], arr_word[1]
    arr_word.join
  end.join(' ')
end

p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"
p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"
p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"
