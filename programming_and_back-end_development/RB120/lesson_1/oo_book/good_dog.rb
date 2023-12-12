class GoodDog
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new('Sparky')
fido = GoodDog.new('Fido')

p sparky.speak
p sparky.name
sparky.name = 'Spartacus'
p sparky.name

p fido.speak
p fido.name
