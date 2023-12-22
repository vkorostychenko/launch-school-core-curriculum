=begin
Let's create a few more methods for our Dog class.

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end

  def fetch
    'fetching!'
  end
end

Create a new class called Cat, which can do everything a dog can, except swim or
fetch. Assume the methods do the exact same thing. Hint: don't just copy and
paste all methods in Dog into Cat; try to come up with some class hierarchy.
=end

class Pet
  def run
    'running!'
  end
  
  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end
  
  def swim
    'swimming!'
  end
  
  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!" 
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

p pete.run                # => "running!"
# p pete.speak              # => NoMethodError

p kitty.run               # => "running!"
p kitty.speak             # => "meow!"
# p kitty.fetch             # => NoMethodError

p dave.speak              # => "bark!"

p bud.run                 # => "running!"
p bud.swim                # => "can't swim!"
