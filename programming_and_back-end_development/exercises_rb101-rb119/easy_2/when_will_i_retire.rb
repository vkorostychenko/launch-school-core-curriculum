puts 'What is your age?'
age = gets.to_i

puts 'At what age would you like to retire?'
retirement_age = gets.to_i

current_year = Time.now.year
working_years_left = retirement_age - age
retirement_year = current_year + working_years_left

puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You have only #{working_years_left} years of work to go!"
