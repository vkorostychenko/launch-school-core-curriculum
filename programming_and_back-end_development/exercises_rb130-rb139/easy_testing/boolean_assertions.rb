# Write a minitest assertion that will fail if the value.odd? is not true.

require 'minitest/autorun'

class TestExercise < Minitest::Test
  def test_
    value = 3
    assert value.odd?
  end
end
