NUMBERS = Hash.new
('0'..'9').each_with_index { |char, idx| NUMBERS[char] = idx }

LETTERS = Hash.new
('a'..'f').each_with_index { |char, idx| LETTERS[char] = idx + 10 }

HEXADECIMALS = NUMBERS.merge(LETTERS)

def hexadecimal_to_integer(str)
  p digits = str.downcase.chars.map { |char| HEXADECIMALS[char] }.reverse
  digits.map.each_with_index { |digit, idx| digit * 16**idx }.sum
end

p hexadecimal_to_integer('4D9f') == 19871
