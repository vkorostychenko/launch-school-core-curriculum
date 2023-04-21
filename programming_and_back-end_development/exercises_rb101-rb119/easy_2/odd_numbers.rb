def print_odd(range)
  range = range.to_a
  range.each { |num| puts num if num.odd? }
end

print_odd(1..99)