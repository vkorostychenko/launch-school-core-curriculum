=begin
Create a class called MyCar. When you initialize a new instance or object of
the class, allow the user to define some instance variables that tell us the
year, color, and model of the car. Create an instance variable that is set to 0
during instantiation of the object to track the current speed of the car
as well. Create instance methods that allow the car to speed up, brake, and shut
the car off.
=end

class MyCar
  attr_accessor :year, :model, :colour

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
end

volkswagen = MyCar.new(2018, 'Grey', 'Multivan')

volkswagen.speed_up(20)
volkswagen.current_speed
volkswagen.speed_up(10)
volkswagen.current_speed
volkswagen.brake(15)
volkswagen.current_speed
volkswagen.shut_down
volkswagen.current_speed
