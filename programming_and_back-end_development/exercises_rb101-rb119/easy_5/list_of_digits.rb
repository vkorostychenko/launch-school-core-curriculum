=begin
Write a method that takes one argument, a positive integer, and returns a list
of the digits in the number.
=end

def digit_list(num)
  digits = []
  until num == 0
    num, dig = num.divmod(10) 
    digits.prepend(dig)
  end
  digits
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
