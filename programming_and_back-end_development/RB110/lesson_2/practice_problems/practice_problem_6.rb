# One of the most frequently used real-world string properties is that of "string substitution",
# where we take a hard-coded string and modify it with various parameters from our program.

# Given this previously seen family hash, print out the name, age and gender of each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  puts "#{name} is #{details['age']}-year-old (#{details['gender']})"
end

# Herman is 32-year-old (male)
# Lily is 30-year-old (female)
# Grandpa is 402-year-old (male)
# Eddie is 10-year-old (male)
# Marilyn is 23-year-old (female)
