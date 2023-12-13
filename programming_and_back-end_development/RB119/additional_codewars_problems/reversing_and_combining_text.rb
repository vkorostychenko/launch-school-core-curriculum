=begin
Difficulty: ___

Your task is to Reverse and Combine Words.

Input: String containing different "words" separated by spaces

1. More than one word? 
    - Reverse each word and combine first with second, third with fourth and so on...
    - (odd number of words => last one stays alone, but has to be reversed too)
2. Start it again until there's only one word without spaces
3. Return your result…

Input: a string
Output: a new string

Rules:
  - given a string containing different "words" separated by spaces
  - return the input string if it contains only one word
  - otherwise, reverse each word
    - combine first with second, third with fourth and so on...
    - (odd number of words => last one stays alone, but has to be reversed too)
  - start it again until there's only one word without spaces
  - return the result

Algorithm:
  - given a string
  - split the string into an array of words and assign it to a variable

  - while the array of words contains more than 1 word
    - create a variable new array of words
    - iterate through the array of words for transformation
      - reverse each word
    - slice the array of reversed words into pairs
      - join the current slice into a string and append it to a new array of words
    - reassign the initial array of words
  - end
  
  - return the split array joined into a string
=end

def reverse_and_combine_text(str)
  words = str.split

  while words.size > 1
    new_words = []

    words.map(&:reverse).each_slice(2) do |pair|
      new_words << pair.join
    end

    words = new_words
  end

  words.join
end

p reverse_and_combine_text("abc def") == "cbafed"
p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf"
