# Write a minitest assertion that will fail if the Array list is not empty.

require 'minitest/autorun'

class TestExercise < Minitest::Test
  def test_
    list = []
    assert_empty list
  end
end
