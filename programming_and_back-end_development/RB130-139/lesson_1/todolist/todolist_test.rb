require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  # def test_done_question
  #   assert_equal(false, @list.done?)
  # end
  def test_done_question
    refute_equal(true, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list << 'test' }
    assert_raises(TypeError) { @list << 5 }
    assert_raises(TypeError) { @list << :test }
  end

  def test_shovel
    new_todo = Todo.new('Wash the car')
    @list << new_todo
    @todos << new_todo
    assert_equal(@todos, @list.to_a)
  end

  def test_add_alias
    new_todo = Todo.new('Mend the bike')
    @list.add(new_todo)
    @todos << new_todo
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(100) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo3, @list.item_at(2))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end
  
  def test_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @list.mark_all_done
    @list.mark_undone_at(1)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done_bang
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(1)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
      ---- Today's Todos ----
      [ ] Buy milk
      [ ] Clean room
      [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    output = <<~OUTPUT.chomp
      ---- Today's Todos ----
      [ ] Buy milk
      [X] Clean room
      [ ] Go to gym
    OUTPUT
    
    @list.mark_done_at(1)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    output = <<~OUTPUT.chomp
      ---- Today's Todos ----
      [X] Buy milk
      [X] Clean room
      [X] Go to gym
    OUTPUT
    
    @list.done!
    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []
    @list.each { |todo| result << todo }

    assert_equal(result, @list.to_a)
  end

  def test_each_returns_orginal_list
    assert_equal(@list, @list.each {})
  end

  def test_select
    @todo1.done!
    list = TodoList.new(@list.title)
    list << @todo1
    assert_equal(list.title, @list.title)
    assert_equal(list.to_s, @list.select(&:done?).to_s)
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title("Buy milk"))
    assert_equal(nil, @list.find_by_title("Absent title"))
  end

  def test_mark_done
    @list.mark_done("Buy milk")
    assert_equal(true, @todo1.done?)
  end
end
