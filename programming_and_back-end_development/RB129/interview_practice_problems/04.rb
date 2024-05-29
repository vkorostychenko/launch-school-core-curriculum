# Describe what the code below outputs and why from Joseph Ochoa

module Attackable
  def attack
    "attacks!"
  end
end

class Characters
  attr_accessor :name, :characters

  def initialize(name) # the parameter `name` isn't used within the method definition
    self.name
    @characters = []
  end

  def display
    name # calls the protected attr_reader `name` method
  end

  protected

  attr_reader :name
  attr_writer :name
end

class Monster < Characters
  include Attackable
  
  def initialize(name)
    super # invokes the method of the same name in the superclass while passing the parameter `name` as an argument
  end
end

class Barbarian < Characters
  def ==(other)
    if(super.self == super.self)
      super.self == super.self
    end
  end
end

conan = Barbarian.new('barb')
rob = Monster.new('monst')
conan.characters << rob
p conan.display

=begin
The code outputs `nil` and returns it, because within the definition of the
instance method `#display` the protected method `name` is invoked, which in turn
references the `@name` instance variable. Since the instance variable was not
set anywhere in the code it references `nil`.
=end
