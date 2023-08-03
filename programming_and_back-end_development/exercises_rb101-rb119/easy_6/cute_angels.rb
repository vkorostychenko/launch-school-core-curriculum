=begin
Write a method that takes a floating point number that represents an angle
between 0 and 360 degrees and returns a String that represents that angle in
degrees, minutes and seconds. You should use a degree symbol (°) to represent
degrees, a single quote (') to represent minutes, and a double quote (") to
represent seconds. A degree has 60 minutes, while a minute has 60 seconds.
=end

DEGREE = "\xC2\xB0"
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = 3600

def dms(angle)
  total_seconds = (angle * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
  sprintf('%.1d%s%.2d\'%.2d"', degrees, DEGREE, minutes, seconds)
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
