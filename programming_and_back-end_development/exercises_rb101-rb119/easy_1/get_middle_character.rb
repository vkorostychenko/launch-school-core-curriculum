def center_of(string)
  case
  when string.empty?
    'Please enter a non-empty string.'
  when string.length.odd?
    center_index = string.length / 2
    string[center_index]
  when string.length.even?
    center_index = (string.length / 2) - 1
    string[center_index, 2]
  end
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
puts center_of('') == 'Please enter a non-empty string.'
