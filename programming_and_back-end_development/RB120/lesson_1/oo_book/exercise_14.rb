=begin
Write a method called age that calls a private method to calculate the age of
the vehicle. Make sure the private method is not available from outside of the
class. You'll need to use Ruby's built-in Time class to help.
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
  
  def age
    puts "Your #{self.model} is #{years_old} years old."
  end

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

  private

  def years_old
    Time.now.year - self.year.to_i
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

my_car = MyCar.new(2018, 'Audi RS6', 'grey')
my_truck = MyTruck.new('2021', 'Toyota Hilux', 'red')

my_car.age
my_truck.age
