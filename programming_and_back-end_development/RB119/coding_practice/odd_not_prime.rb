=begin
For "x", determine how many positive integers less than or equal to "x" are odd 
but not prime. Assume "x" is an integer between 1 and 10000.

Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime,
so the answer is 1
Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime,
so the answer is 2

A prime number (or a prime) is a natural number greater than 1 that has no
positive divisors other than 1 and itself.

p odd_not_prime(15) == 3
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20

The PEDAC process

P: Understanding the Problem
  - Explicit requirements:
    - Input: integer
      - between 1 and 10000
    - Output: integer
      - represents how many positive integers are less than or equal to the
        input integer
        are odd but not prime
  - Implicit requirements:
  - Questions:

E: Examples and Test Cases:
  - p odd_not_prime(15) == 3
  - p odd_not_prime(48) == 10
  - p odd_not_prime(82) == 20

D: Data Structure:
A: Algorithm:
  - initialise the local variable 'count' to 0
  - iterate through each integer from 1 to an input integer inclusively
    - if a current integer is odd and not prime
      - increment 'count' by 1
  - return 'count'

  - prime?
    - if the number equals 0 or equals 1
      - return false
    - else if the number equals 2
      - return true
    - iterate from 2 to the number exclusively
     - if the number divides equally by the current number
       - return false
    return true

C: Code:
=end

def prime?(num)
  if num == 0 || num == 1
    return false
  elsif num == 2
    return true
  end

  (2...num).each do |n|
    return false if num % n == 0
  end

  true
end

def odd_not_prime(num)
  count = 0

  (1..num).each do |n|
    count += 1 if n.odd? && !prime?(n)
  end

  count
end

p odd_not_prime(15) == 3
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20
