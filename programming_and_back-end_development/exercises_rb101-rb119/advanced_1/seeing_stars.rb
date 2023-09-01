=begin
Write a method that displays an 8-pointed star in an nxn grid, where n is an odd
integer that is supplied as an argument to the method. The smallest such star
you need to handle is a 7x7 grid.

Examples

star(7)

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *

star(9)

*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *

star(11)

*    *    *
 *   *   *
  *  *  *
   * * *
    ***
***********
    ***
   * * *
  *  *  *
 *   *   *
*    *    *
=end

def print_row(grid_size, spaces)
  gap = ' ' * spaces
  row = "*#{gap}*#{gap}*".center(grid_size)
  puts row
end

def star(grid_size)
  gap = (grid_size - 3) / 2

  gap.downto(0).each { |spaces| print_row(grid_size, spaces) }
  puts '*' * grid_size
  0.upto(gap).each   { |spaces| print_row(grid_size, spaces) }
end

star(7)
star(9)
