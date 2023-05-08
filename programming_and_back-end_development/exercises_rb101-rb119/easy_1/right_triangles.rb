def triangle(number)
  stars = 1

  number.times do
    line = '*' * stars
    puts line.ljust(number)
    stars += 1  
  end  
end

triangle(5)
triangle(9)
