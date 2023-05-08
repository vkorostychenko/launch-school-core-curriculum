def stringy(size, start = 1)
  numbers = []

  size.times do |idx|
    if start == 0
      number = idx.odd? ? 1 : 0
    else
      number = idx.even? ? 1 : 0
    end
    numbers << number
  end

  numbers.join
end

puts stringy(6, 0)
puts stringy(9)
puts stringy(4)
puts stringy(7)
