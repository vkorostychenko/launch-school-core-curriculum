# Write a minitest assertion that will fail if the class of value is not Numeric
# or one of Numeric's subclasses (e.g., Integer, Float, etc).

require 'minitest/autorun'

class TestExercise < Minitest::Test
  def test_
    values = [1, 1.0, 1r, Complex(1)]
    values.each { |value| assert_kind_of Numeric, value }
  end
end
