=begin
Which of these two classes would create objects that would have an instance
variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end
=end

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

pizza = Pizza.new('cheese')
fruit = Fruit.new('pineapple')

p pizza.instance_variables
p fruit.instance_variables
