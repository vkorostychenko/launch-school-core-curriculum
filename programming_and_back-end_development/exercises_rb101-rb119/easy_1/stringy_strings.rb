def stringy(size, start = 1)
  numbers = []
  
  size.times do |index|
    if start == 1
      number = index.even? ? 1 : 0
    else
      number = index.odd? ? 1 : 0
    end
    numbers << number
  end
  
  numbers.join
end

puts stringy(6, 0)
puts stringy(9)
puts stringy(4)
puts stringy(7)
