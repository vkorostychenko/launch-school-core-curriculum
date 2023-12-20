=begin
Create a superclass called Vehicle for your MyCar class to inherit from and move
the behavior that isn't specific to the MyCar class to the superclass.
Create a constant in your MyCar class that stores information about the vehicle
that makes it different from other types of Vehicles.

Then create a new class called MyTruck that inherits from your superclass that
also has a constant defined that separates it from the MyCar class in some way.
=end

class Vehicle
  attr_accessor :colour
  attr_reader :year, :model

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas."
  end

  def initialize(year, model, colour)
    @year = year
    @model = model
    @colour = colour
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end

  def spray_paint(colour)
    self.colour = colour
    puts "Your new #{colour} paint job looks great!"
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  
  def to_s
    "My car is a #{colour}, #{year}, #{model}!"
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
  
  def to_s
    "My truck is a #{colour}, #{year}, #{model}!"
  end
end

my_car = MyCar.new(2023, 'Audi RS6', 'grey')
my_truck = MyTruck.new(2023, 'Toyota Hilux', 'red')

puts my_car
puts my_truck
