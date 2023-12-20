=begin
Move all of the methods from the MyCar class that also pertain to the MyTruck
class into the Vehicle class. Make sure that all of your previous method calls
are working when you are finished.
=end

module Towable
  def can_tow?(pounds)
    pounds < 2000
  end
end

class Vehicle
  attr_accessor :colour
  attr_reader :year, :model

  @@number_of_vehicles = 0

  def self.number_of_vehicles
    puts "This program has created #{@@number_of_vehicles} vehicles"
  end

  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas."
  end

  def initialize(year, model, colour)
    @year = year
    @model = model
    @colour = colour
    @current_speed = 0
    @@number_of_vehicles += 1
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
  
  include Towable

  def to_s
    "My truck is a #{colour}, #{year}, #{model}!"
  end
end

my_car = MyCar.new(2023, 'Audi RS6', 'grey')
my_truck = MyTruck.new(2023, 'Toyota Hilux', 'red')

my_car.speed_up(30)
my_car.current_speed

my_truck.spray_paint('gold')
puts my_truck.to_s
