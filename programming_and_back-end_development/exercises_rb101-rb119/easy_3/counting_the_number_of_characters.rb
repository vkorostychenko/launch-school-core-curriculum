print 'Please write word or multiple words: '
input = gets.chomp

sum_char = words.gsub(' ', '').size

puts "There are #{sum_char} characters in #{input}"
