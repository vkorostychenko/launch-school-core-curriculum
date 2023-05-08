def print_left_bottom(number)
  stars = 1

  number.times do
    line = '*' * stars
    puts line.ljust(number)
    stars += 1  
  end  
end

def print_left_top(number)
  stars = number

  number.times do
    line = '*' * stars
    puts line.ljust(number)
    stars -= 1  
  end  
end

def print_right_bottom(number)
  stars = 1

  number.times do
    line = '*' * stars
    puts line.rjust(number)
    stars += 1
  end  
end

def print_right_top(number)
  stars = number

  number.times do
    line = '*' * stars
    puts line.rjust(number)
    stars -= 1
  end  
end

def triangle(number, corner)
  case corner
  when 'left bottom' then print_left_bottom(number)
  when 'left top' then print_left_top(number)
  when 'right bottom' then print_right_bottom(number)
  when 'right top' then print_right_top(number)
  end
end

triangle(10, 'left bottom')
triangle(5, 'left top')
triangle(10, 'right bottom')
triangle(5, 'right top')
