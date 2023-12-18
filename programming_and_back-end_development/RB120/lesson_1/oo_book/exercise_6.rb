# Add a class method to your MyCar class that calculates the gas mileage
# (i.e. miles per gallon) of any car.

class MyCar
  attr_accessor :colour
  attr_reader :year

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

MyCar.gas_mileage(13, 351)
