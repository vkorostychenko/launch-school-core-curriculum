# Create a clock that is independent of date.

# You should be able to add minutes to and subtract minutes from the time
# represented by a given Clock object. Note that you should not mutate Clock
# objects when adding and subtracting minutes -- create a new Clock object.

# Two clock objects that represent the same time should be equal to each other.

# You may not use any built-in date or time functionality; just use arithmetic
# operations.

class Clock
  MINUTES_A_DAY = 24 * 60

  def self.at(hours, minutes=0)
    new(hours, minutes)
  end

  def initialize(hours, minutes)
    @time_in_minutes = ((hours * 60) + minutes) % MINUTES_A_DAY 
  end

  def -(min)
    new_time = time_in_minutes - min
    hours, minutes = new_time.divmod(60)
    Clock.new(hours, minutes)
  end
  
  def +(min)
    new_time = time_in_minutes + min
    hours, minutes = new_time.divmod(60)
    Clock.new(hours, minutes)
  end

  def to_s
    hours, minutes = time_in_minutes.divmod(60)
    sprintf("%02d:%02d", hours, minutes)
  end

  def ==(other)
    time_in_minutes == other.time_in_minutes
  end

  protected

  attr_reader :time_in_minutes
end
