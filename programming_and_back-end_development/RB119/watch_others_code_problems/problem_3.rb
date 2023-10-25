=begin
You have to create a method that takes a positive integer number and returns
the next bigger number formed by the same digits:

12 ==> 21
513==> 531
2017==> 2071

If no bigger number can be composed using those digits, return -1:

9 ==> -1
111 ==> -1
531 ==2 -1
=end

=begin
Input: a number
Output: a number or -1

Rules:
  - take a positive integer number and return the next bigger number formed by
    the same digits
  - if no bigger number can be composed using those digits, return -1

Examples:
6436 --> 6463 (the digits at indices -1 and -2 are swapped)
6463 --> 6634 (the digits at indices -2 and -3 are swapped)
6634 --> 6643 (the digits at indices -1 and -2 are swapped)
6643 --> -1

Algorithm:
  - split the input number into an array of digits
  - initialise the local variable index to reference an integer 0 to keep track
    of the current index
  - create a loop
    - break out of the loop if the current index + 1 is greater than the length
      of the array of digits - 1
    - if the digit at the current index is greater than the digit at the
      index + 1
      - swap their positions
      - reverse the array of digits
      - join them together and convert them to a number
      - return this number
    - end
    - increment the current index by 1
  - end
  - return -1
=end

def next_bigger_num(num)
  digits = num.digits
  index = 0

  loop do
    break if index + 1 > digits.size - 1

    if digits[index] > digits[index + 1]
      digits[index], digits[index + 1] = digits[index + 1], digits[index]
      
      return digits.reverse.join.to_i
    end

    index += 1
  end

  -1
end

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798
