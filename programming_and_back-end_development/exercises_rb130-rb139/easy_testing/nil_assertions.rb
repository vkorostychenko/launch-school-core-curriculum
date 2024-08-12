# Write a minitest assertion that will fail if value is not nil.

require 'minitest/autorun'

class TestExercise < Minitest::Test
  def test_
    value = nil
    assert_nil value
  end
end
