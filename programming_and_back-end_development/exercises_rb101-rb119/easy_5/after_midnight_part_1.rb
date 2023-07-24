=begin
The time of day can be represented as the number of minutes before or after midnight.
If the number of minutes is positive, the time is after midnight. If the number of
minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the
time of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

The PEDAC process

P: Understanding the problem
  - Explicit requirements:
    - Input: integer
      - positive or negative integer representing the time of day in minutes
      - negative – the time is before midnight
      - positive – teh time is after midnight
    - Output: string
      - the time of day in 24 hour format (hh:mm)
  - Implicit requirements:
  - Questions:

E: Examples and Test Cases
  - time_of_day(0) == "00:00"
  - time_of_day(-3) == "23:57"
  - time_of_day(35) == "00:35"
  - time_of_day(-1437) == "00:03"
  - time_of_day(3000) == "02:00"
  - time_of_day(800) == "13:20"
  - time_of_day(-4231) == "01:29"

D: Data Structures:
A: Algorithms
  perform a modulo division with remainder on the object referenced by 'integer' by 60
  initialise the local variable 'hour' to reference a quotient
  initialise the local variable 'min' to reference a remainder
  perform a modulo division on the object referenced by 'hour' and reassign 'hour' to the result
  output 'hour' and 'min' in required format
=end

def time_of_day(int)
  hour, min = int.divmod(60)
  hour %= 24
  sprintf('%02d:%02d', hour, min)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
