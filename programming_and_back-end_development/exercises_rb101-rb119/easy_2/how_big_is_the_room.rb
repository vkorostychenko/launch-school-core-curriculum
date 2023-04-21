# SQMETERS_TO_SQFEET = 10.7639

# puts ">> Enter the length of the room in meters: "
# length = gets.to_f

# puts ">> Enter the width of the room in meters: "
# width = gets.to_f

# area_sqmeters = (length * width).round(2)
# area_sqfeet = (area_sqmeters * SQMETERS_TO_SQFEET).round(2)

# puts "The area of the room is #{area_sqmeters} square meters " + \
#       "(#{area_sqfeet} square feet)."

# further exploration

SQFEET_TO_SQINCHES = 144
SQFEET_TO_SQCENTIMETERS = 929.03


puts ">> Enter the length of the room in feet: "
length = gets.to_f

puts ">> Enter the width of the room in feet:"
width = gets.to_f

area_sqfeet = (length * width).round(2)
area_sqinches = (area_sqfeet * SQFEET_TO_SQINCHES).round(2)
area_sqcentimeters = (area_sqfeet * SQFEET_TO_SQCENTIMETERS).round(2)

puts "The area of the room is #{area_sqfeet} square feet " + \
     "(#{area_sqinches} square inches or #{area_sqcentimeters} square centimeters)"
