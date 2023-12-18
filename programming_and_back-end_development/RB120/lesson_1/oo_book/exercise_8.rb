=begin
When running the following code...

class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

We get the following error...

test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

Why do we get this error and how do we fix it?
=end

class Person
  # attr_reader :name # (only creates a getter method)
  attr_accessor :name # (creates both getter and setter methods)
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
p bob.name

bob.name = "Bob"
p bob.name
