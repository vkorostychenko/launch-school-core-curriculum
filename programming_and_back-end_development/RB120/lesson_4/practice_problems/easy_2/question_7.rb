=begin
If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

Explain what the @@cats_count variable does and how it works. 
What code would you need to write to test your theory?
=end

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

tom = Cat.new('British Shorthair')
bob = Cat.new('Bombay cat')

p Cat.cats_count # 2
