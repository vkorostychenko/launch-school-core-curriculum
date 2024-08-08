# Given this code:

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# Fill out the following method calls for gather so that they produce the
# corresponding output shown in numbers 1-4 listed below:

# 1)

gather(items) do |*items, last_item|
  puts items.join(', ')
  puts last_item
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# 2)

gather(items) do |first_item, *items, last_item|
  puts first_item
  puts items.join(', ')
  puts last_item
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

# 3)

gather(items) do |first_item, *items|
  puts first_item
  puts items.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

# 4)

gather(items) do |first, second, third, fourth|
  puts "#{first}, #{second}, #{third} and #{fourth}"
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
