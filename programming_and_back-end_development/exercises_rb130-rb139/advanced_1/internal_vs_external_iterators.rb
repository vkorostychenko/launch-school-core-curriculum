# In this exercise, your task is to create a new Enumerator object.
# When creating a new Enumerator, you may define what values are iterated upon.
# We'll want to create an Enumerator that can iterate over an infinite list of
# factorials. Once you make this new Enumerator, test it out by printing out the
# first 7 factorial values, starting with zero factorial.

# More specifically, print the first 7 factorials by using an "External Iterator".
# Once you have done so, see what happens if you print 3 more factorials.
# Now, reset your Enumerator (use the rewind method). Finally, print 7 more
# factorials.

factorial = Enumerator.new do |yielder|
  number = 0
  fact_number = 1
  loop do
    fact_number = number.zero? ? 1 : fact_number * number
    yielder << fact_number
    number += 1
  end
end

# External iterators

6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
factorial.rewind
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="

# Internal iterators

factorial.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end
