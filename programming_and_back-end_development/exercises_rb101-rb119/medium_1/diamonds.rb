=begin
Write a method that displays a 4-pointed diamond in an n x n grid, where n is
an odd integer that is supplied as an argument to the method. You may assume
that the argument will always be an odd integer.

diamond(1)

*

diamond(3)

 *
***
 *

 diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

n = 9
=end

def print_row(number, grid_size)
  puts ('*' * number).center(grid_size)
end

def diamond(grid_size)  
  number_of_asterisks = (1..grid_size).select(&:odd?)

  number_of_asterisks.each do |number|
    print_row(number, grid_size)
  end

  number_of_asterisks.reverse_each do |number|
    next if number == grid_size
    print_row(number, grid_size)
  end
end

diamond(1)
diamond(3)
diamond(9)
