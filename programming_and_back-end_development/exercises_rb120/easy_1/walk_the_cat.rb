=begin
Using the following code, create a module named Walkable that contains a method
named #walk. This method should print Let's go for a walk! when invoked.
Include Walkable in Cat and invoke #walk on kitty.

Hello! My name is Sophie!
Let's go for a walk!
=end

module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end
  
  def greet
    puts "Hello my name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.walk
