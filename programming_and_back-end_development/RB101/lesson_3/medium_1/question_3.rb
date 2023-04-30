def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(32)
p factors(0)
p factors(-32)

# number % divisor == 0 is to determine if the result of the division is an integer number.
# The second to last line is return value of the method. Without it method would have returned nil.
