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
