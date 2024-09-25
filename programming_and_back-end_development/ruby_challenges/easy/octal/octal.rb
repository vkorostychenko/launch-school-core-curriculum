# Implement octal to decimal conversion.
# Given an octal input string, your program should produce a decimal output.
# Treat invalid input as octal 0.
# The only valid digits in an octal number are 0, 1, 2, 3, 4, 5, 6, and 7.

# Note: Implement the conversion yourself.
# Don't use any built-in or library methods that perform the necessary conversions
# for you. In this exercise, the code necessary to perform the conversion is what
# we're looking for.

# 233 # octal
# = 2*8^2 + 3*8^1 + 3*8^0
# = 2*64  + 3*8   + 3*1
# = 128   + 24    + 3
# = 155

class Octal
  attr_reader :number

  def initialize(str)
    @number = str
  end

  def to_decimal
    return 0 unless number.match?(/\A[0-7]+\z/)

    digits = number.to_i.digits
    
    digits.map.with_index do |digit, exponent|
      digit*(8**exponent)
    end.sum
  end
end
