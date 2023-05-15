SQMETERS_TO_SQFEET = 10.7639

puts ">> Enter the length of the room in meters: "
length = gets.to_f

puts ">> Enter the width of the room in meters: "
width = gets.to_f

area_sqmeters = (length * width).round(2)
area_sqfeet = (area_sqmeters * SQMETERS_TO_SQFEET).round(2)

puts "The area of the room is #{area_sqmeters} square meters " + \
      "(#{area_sqfeet} square feet)."
