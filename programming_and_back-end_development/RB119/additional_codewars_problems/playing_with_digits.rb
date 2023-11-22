=begin
Difficulty: ___

Some numbers have funny properties. For example:

89 --> 8¹ + 9² = 89 * 1

695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2

46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

Given a positive integer n written as abcd... (a, b, c, d... being digits) and a positive integer p

We want to find a positive integer k, if it exists, such as the sum of the digits of n 
taken to the successive powers of p is equal to k * n.

In other words:
                                  [----------------------SUM---------------------]                
  Is there an integer k such as : (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k

                                  if there is a SUM that is greater than or equal to n
                                  is there a k which is a positive integer where
                                  n * k = SUM    or  is there k = SUM / n  &&  SUM % n == 0


  If this is the case we will return k, if not return -1.

Note: n and p will always be given as strictly positive integers.

Examples: 
  dig_pow( 189,) should return 1 since 8¹ + 9² = 89 = 89 * 1
  dig_pow(92, 1) should return -1 since there is no k such as 9¹ + 2² equals 92 * k
  dig_pow(695, 2) should return 2 since 6² + 9³ + 5⁴= 1390 =! 695 * 1 // 1390 == 695 * 2
  dig_pow(46288, 3) should return 51 since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

Input: two integers
Output: an integer

Rules:
  - Explicit:
    - given two numbers
    - find a positive integer k, if it exists, such as the sum of the digits of n 
      taken to the successive powers of p is equal to k * n
    - return -1 if there is no such a number
    - otherwise, return the k

Algorithm:
  - given a number and a positive integer
  - get an array of digits of the given number
  - initialize the local variable sum to the return value
    - iterate over the array of digits for transformation with index
      - current digit ** (power + current index)
    - get sum
  - if modulo division of sum by the input number is equal to 0
    - return the result of the division sum by the input number
  - else if the sum is less than the input number
    - return -1
  - end
=end

def dig_pow(number, power)
  digits = number.digits.reverse

  sum = digits.map.with_index do |digit, index|
    digit ** (power + index)
  end.sum

  sum % number == 0 ? sum / number : -1
end


p dig_pow(89, 1) == 1
p dig_pow(92, 1) == -1
p dig_pow(695, 2) == 2
p dig_pow(46288, 3) == 51
