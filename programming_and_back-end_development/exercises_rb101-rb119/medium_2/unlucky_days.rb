=begin
Write a method that returns the number of Friday the 13ths in the year given by
an argument. You may assume that the year is greater than 1752 (when
the United Kingdom adopted the modern Gregorian Calendar) and that it will
remain in use for the foreseeable future.
=end

require 'date'

def friday_13th(year)
 limit = Date.new(year, 12, 31)
 unlucky_count = 0

 Date.new(year).step(limit) do |date|
  unlucky_count += 1 if date.friday? && date.mday == 13
 end

 unlucky_count
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
