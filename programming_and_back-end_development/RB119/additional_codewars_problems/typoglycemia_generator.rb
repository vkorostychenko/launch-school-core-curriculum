=begin
Difficulty: hard

There is a message that is circulating via public media that claims a reader can
easily read a message where the inner letters of each words is scrambled, as 
longas the first and last letters remain the same and the word contains all the 
letters.

Another example shows that it is quite difficult to read the text where all the 
letters are reversed rather than scrambled.

In this kata we will make a generator that generates text in a similar pattern, 
but instead of scrambled or reversed, ours will be sorted alphabetically

Requirement

return a string where:
  1) the first and last characters remain in original place for each word
  2) characters between the first and last characters must be sorted alphabetically
  3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions

  1) words are seperated by single spaces
  2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
  3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
  4) for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
  5) ignore capitalisation

for reference: http://en.wikipedia.org/wiki/Typoglycemia

Input: a string
Output: a new string

Rules:
  - given a string
  - return a string where:
  1) the first and last characters remain in original place for each word
  2) characters between the first and last characters must be sorted alphabetically
  3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Algorithm:
  - given a string
  - create a list of special characters
  - split the string into an array of words
  - iterate through the array of words for transformation
    - split the current word into an array of characters
    - delete everything that is not a letter
      - split the word into an array of characters
      - delete the first and the last character
      - sort destructively

    - iterate through the original version of the splitted word for transformation
      - create a local variable counter and set it to 0
      - if the current character is a special character
        - keep the character as it is
      - else if the current character is a letter AND the counter is 0
        - increment counter by 1
        - keep the character as it is
      - else if the length of the clean copy array is not 0
        - shift the last character from the clean copy of a string
      - else
        - keep the character as it is
    - join the array of characters together into a string
  - join an array of word with spaces and return it
=end

def scramble_words(str)
  list = ['-', '\'', ',', '.']
  
  str.split.map do |word|
    middle = word.scan(/[a-z]/)
    middle.shift
    middle.pop
    middle.sort!
    counter = 0
    first_char = false
    
    word.chars.map do |char|
      
      if list.include?(char)
        char
      elsif char.match?(/[a-z]/) && first_char #counter == 0
        # counter += 1
        first_char = true
        char

      elsif middle.size != 0
        middle.shift
      else
        char
      end
    end.join
  end.join(' ')
end

p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."
