=begin
If you take a number like 735291, and rotate it to the left, you get 352917.
If you now keep the first digit fixed in place, and rotate the remaining digits,
you get 329175. Keep the first 2 digits fixed in place and rotate again to
321759. Keep the first 3 digits fixed in place and rotate again to get 321597.
Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to
get 321579. The resulting number is called the maximum rotation of the original
number.

Write a method that takes an integer as argument, and returns the maximum
rotation of that argument. You can (and probably should) use the
rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.
              
[]735291 -> 352917
[3]52917 -> 329175
[32]9175 -> 321759
[321]759 -> 321597
[3215]97 -> 321579
=end

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_rightmost_digits(num, n)
  num_arr = num.digits.reverse
  num_arr[-n..-1] = rotate_array(num_arr[-n..-1])
  num_arr.join.to_i
end

def max_rotation(num)
  n_digits = num.digits.count

  until n_digits == 1
    num = rotate_rightmost_digits(num, n_digits)
    n_digits -= 1
  end

  num
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
