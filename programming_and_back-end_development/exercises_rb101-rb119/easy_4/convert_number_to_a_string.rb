# DIGITS = {
#   '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
#   '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
# }

# def integer_to_string(int)
#   return '0' if int == 0

#   arr = []

#   number = int
#   while number > 0
#     arr << number % 10
#     number /= 10
#   end

#   arr.map! { |num| DIGITS.key(num) }
#   arr.reverse.join
# end

DIGITS = ('0'..'9').to_a

def integer_to_string(number)
  result = ''

  loop do
    number, remainder = number.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end
  
  result
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
