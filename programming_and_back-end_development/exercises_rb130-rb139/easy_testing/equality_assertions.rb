# Write a minitest assertion that will fail if value.downcase does not return 'xyz'.

require 'minitest/autorun'

class TestExercise < Minitest::Test
  def test_
    value = 'XYZ'
    assert_equal 'xyz', value.downcase
  end
end
