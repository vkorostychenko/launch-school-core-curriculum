=begin
Difficulty: ___

In this Kata, you will be given two integers n and k and your task is to 
remove k-digits from n and return the lowest number possible, without changing
the order of the digits in n. Return the result as a string.

Let's take an example of solve(123056,4). We need to remove 4 digits from 123056 
and return the lowest possible number. The best digits to remove are (1,2,3,6) 
so that the remaining digits are '05'. Therefore, solve(123056,4) = '05'.

Note 

The order of the numbers in n does not change: solve(1284569,2) = '12456', 
because we have removed 8 and 9.

Input: two integers
Output: a string

Rules:
  - given two integers n and k
  - remove k digits from n
  - return the lowest number possible as a string, without changing the order
    of the digits in n

Algorithm:
  - given two integers n and k
  - create an array of digits from n and assign to the local variable digits
  - until the k is equal to 0
    - iterate from 0 up to the length of the array of digits - 1 for transformation
      - iterate through the array of digits for selection with index
        - select each digit except the one at the current index
      - join the digits together to get a string
    - assign the min value chosen by converting the string element to
      an integer to the local variable lowest_number (currently a string)
    - reassign the digits array to the return value of converting the current
      lowest_string into an array of characters, then each character converted
      to an integer
    - decrement k by 1
  - return the lowest_number
=end

def solve(n, k)
  digits = n.digits.reverse

  digits.combination(digits.size - k).map(&:join).min_by(&:to_i)
end

p solve(123056,1) =='12056'
p solve(123056,2) =='1056'
p solve(123056,3) =='056'
p solve(123056,4) =='05'
p solve(1284569,1) =='124569'
p solve(1284569,2) =='12456'
p solve(1284569,3) =='1245'
p solve(1284569,4) =='124'
