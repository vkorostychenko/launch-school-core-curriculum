# The Greek mathematician Nicomachus devised a classification scheme for natural
# numbers (1, 2, 3, ...), identifying each as belonging uniquely to the categories
# of abundant, perfect, or deficient based on a comparison between the number and
# the sum of its positive divisors (the numbers that can be evenly divided into
# the target number with no remainder, excluding the number itself). For instance,
# the positive divisors of 15 are 1, 3, and 5. This sum is known as the Aliquot sum.

# Perfect numbers have an Aliquot sum that is equal to the original number.
# Abundant numbers have an Aliquot sum that is greater than the original number.
# Deficient numbers have an Aliquot sum that is less than the original number.

# Examples:

# 6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
# 28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
# 15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.
# 24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
# Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

# Write a program that can tell whether a number is perfect, abundant, or deficient.

=begin
- Find divisors of a given number
  - create an empty array to store found divisors
  - iterate over numbers from 1 upto the given number
  - divide the number by the current potential divisor
  - if the reminder of the division is equal to 0, that means that the current potential divisor is a divisor
  - add the divisor to the list of divisors
- Find the sum of the divisors
- Return an appropriate classification for a number
=end

class PerfectNumber  
  def self.classify(number)
    raise StandardError.new('Must be a positive interger') if number.negative?

    aliquot_sum = (1..number / 2).select do |potential_divisor| # Evaluating numbers that are more than half of the original number is unnecessary since they can't be divisors.
      number % potential_divisor == 0
    end.sum

    if aliquot_sum == number
      'perfect'
    elsif aliquot_sum > number
      'abundant'
    else
      'deficient'
    end
  end
end
