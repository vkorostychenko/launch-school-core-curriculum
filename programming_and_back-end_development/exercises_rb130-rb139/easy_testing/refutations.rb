# Write a test that will fail if 'xyz' is one of the elements in the Array list:

require 'minitest/autorun'

class TestExercise < Minitest::Test
  def test_
    list = ['xy']
    refute_includes list, 'xyz'
  end
end
