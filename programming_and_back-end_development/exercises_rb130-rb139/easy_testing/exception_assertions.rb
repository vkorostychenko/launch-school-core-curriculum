# Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.

require 'minitest/autorun'

class NoExperienceError < StandardError; end

class Employee
  def hire
    raise NoExperienceError unless @experience
  end
end

class TestExercise < Minitest::Test
  def test_
    employee = Employee.new
    assert_raises(NoExperienceError) { employee.hire }
  end
end
