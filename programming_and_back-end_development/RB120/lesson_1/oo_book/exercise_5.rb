=begin
You want to create a nice interface that allows you to accurately describe the
action you want your program to perform. Create a method called spray_paint that
can be called on an object and will modify the color of the car.
=end

class MyCar
  attr_accessor :colour
  attr_reader :year 

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

volkswagen = MyCar.new(2018, 'Multivan', 'Grey')

volkswagen.speed_up(20)
volkswagen.current_speed
volkswagen.speed_up(10)
volkswagen.current_speed
volkswagen.brake(15)
volkswagen.current_speed
volkswagen.shut_down
volkswagen.current_speed

volkswagen.spray_paint 'White'
p volkswagen.year
p volkswagen
