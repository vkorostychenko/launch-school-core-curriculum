=begin
As seen in the previous exercise, the time of day can be represented as the number
of minutes before or after midnight. If the number of minutes is positive, the
time is after midnight. If the number of minutes is negative, the time is before
midnight.

Write two methods that each take a time of day in 24 hour format, and return the
number of minutes before and after midnight, respectively. Both methods should
return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

The PEDAC process

P: Understanding the problem
  - Explicit requirements:
    - Input: string
      - the time of day in 24 hour format ('hh:mm')
    - Output: integer
      - number of minutes before or after midnight (0..1439)
  - Implicit requirements:
  - Questions:

E: Examples and Test Cases:
  - after_midnight('00:00') == 0
  - before_midnight('00:00') == 0
  - after_midnight('12:34') == 754
  - before_midnight('12:34') == 686
  - after_midnight('24:00') == 0
  - before_midnight('24:00') == 0

D: Data Structures:
A: Algorithms:
=end

HOURS_PER_DAY = 24
MINUTES_PER_HOUR = 60

def after_midnight(time_str)
  hour, min = time_str.split(':').map(&:to_i)
  return 0 if hour == HOURS_PER_DAY
  hour_to_min = hour * MINUTES_PER_HOUR
  hour_to_min + min
end

def before_midnight(time_str)
  hour, min = time_str.split(':').map(&:to_i)
  return 0 if hour == HOURS_PER_DAY
  hour_to_min = hour * MINUTES_PER_HOUR
  hour_to_min - min
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
