# Write a program that, given a natural number and a set of one or more other
# numbers, can find the sum of all the multiples of the numbers in the set that
# are less than the first number. If the set of numbers is not given, use
# a default set of 3 and 5.

# For instance, if we list all the natural numbers up to, but not including,
# 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18.
# The sum of these multiples is 78.

class SumOfMultiples
  def self.to(number)
    SumOfMultiples.new(3, 5).to(number)
  end

  def initialize(*numbers)
    @set = numbers
  end

  def to(number)
    multiples = []
    (1...number).each do |potential_multiple|
      @set.each do |number|
        multiples << potential_multiple if potential_multiple % number == 0
      end
    end
    multiples.uniq.sum
  end
end
