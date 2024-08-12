# Write a minitest assertion that will fail if the 'xyz' is not in the Array list.

require 'minitest/autorun'

class TestExercise < Minitest::Test
  def test_
    list = ['xyz']
    assert_includes list, 'xyz'
  end
end
