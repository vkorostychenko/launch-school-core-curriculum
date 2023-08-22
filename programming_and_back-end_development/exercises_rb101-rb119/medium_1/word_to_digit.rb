=begin
Write a method that takes a sentence string as input, and returns the same
string with any sequence of the words 'zero', 'one', 'two', 'three', 'four',
'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.


=end

WORDS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six',
         'seven','eight', 'nine']

def word_to_digit(str)
  WORDS.each_with_index do |word, digit|
    str.gsub!(/\b#{word}\b/i, digit.to_s)
  end

  str
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')\
== 'Please call me at 5 5 5 1 2 3 4. Thanks.'
