=begin
Given a List [] of n integers, find a minimum number to be inserted in a list,
so that sum of all elements of list should equal the closest prime number.

Notes
  List size is at least 2.

  List's numbers will only positives (n > 0).

  Repetition of numbers in the list could occur.

  The newer list's sum should equal the closest prime number.

Input >> Output Examples

1- minimumNumber ({3,1,2}) ==> return (1)

Explanation:

  Since, the sum of the list's elements is equal to (6), the minimum number to be
  inserted to transform the sum to prime number is (1), which will make the sum 
  of the List equal the closest prime number (7).

2-  minimumNumber ({2,12,8,4,6}) ==> return (5)

Explanation:

  Since the sum of the list's elements is equal to (32), the minimum number to be
  inserted to transform the sum to prime number is (5), which will make the sum
  of the List equal the closest prime number (37).

3- minimumNumber ({50,39,49,6,17,28}) ==> return (2)

Explanation:

  Since the sum of the list's elements is equal to (189), the minimum number to
  be inserted to transform the sum to prime number is (2), which will make the
  sum of the List equal to the closest prime number (191).

Input: an array
Output: an integer

Rules:
  - given a list (min length == 2) of positive integers
  - repetition of numbers in the list could occur
  - find a minimum number to be inserted in a list,
    so that sum of all elements of list should equal the closest prime number

Algorithm:
  - given a list of positive integers
  - require 'prime' module
  - find sum of the input array
  - increment the sum by 1 until it is a prime number
  - return the result of subtraction of the prime number - sum of the list
=end

require 'prime'

def minimum_number(numbers)
  sum = numbers.sum

  until sum.prime?
    sum += 1
  end

  sum - numbers.sum
end

p minimum_number([3,1,2]) == 1
p minimum_number([5,2]) == 0
p minimum_number([1,1,1])== 0
p minimum_number([2,12,8,4,6]) == 5
p minimum_number([50,39,49,6,17,28]) == 2
