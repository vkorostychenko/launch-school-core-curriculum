=begin
Write a program that reads the content of a text file and then prints the
longest sentence in the file based on number of words. Sentences may end with
periods (.), exclamation points (!), or question marks (?). Any sequence of
characters that are not spaces or sentence-ending characters should be treated
as a word. You should also print the number of words in the longest sentence.
=end

text = File.read("sample_text.txt")
sentences = text.split(/[.!?]/)
large_sentence = sentences.max_by { |sentence| sentence.split.size }
large_sentence = large_sentence.strip
number_of_words = large_sentence.split.size

puts "#{large_sentence}"
puts "Containing #{number_of_words} words"
