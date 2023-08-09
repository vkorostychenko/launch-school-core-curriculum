=begin
Write a method that counts the number of occurrences of each element in a given
array.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print
each element alongside the number of occurrences.

Expected output:

car => 4
truck => 3
SUV => 1
motorcycle => 2
=end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

# def count_occurrences(arr)
#   occurrences = {}

#   arr.uniq.each do |el|
#     occurrences[el] = arr.count(el)
#   end

#   occurrences.each do |el, count|
#     puts "#{el} => #{count}"
#   end
# end

def count_occurrences(arr)
  arr.tally.each { |el, count| puts "#{el} => #{count}" }
end

p count_occurrences(vehicles)
