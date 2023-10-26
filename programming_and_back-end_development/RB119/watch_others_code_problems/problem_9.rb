=begin
You are going to be given an array of integers. Your job is to take that array
and find an index N where the sum of the integers to the left of N is equal to
the sum of the integers to the right of N. If there is no index that would make
this happen, return -1.

For example:
Let's say you are given the array [1, 2, 3, 4, 3, 2, 1]:
Your method will return the index 3, because at the 3rd position of the array,
the sum of left side of the index [1, 2, 3] and the sum of the right side of the
index [3, 2, 1] both equal 6.

Another one:
You are given the array [20, 10, -80, 10, 10, 15, 35]
At index 0 the left side is []
The right side is [10, -80, 10, 10, 15, 35]
They both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.
=end

=begin
Input: an array of integers
Output: -1 or a number representing an index

Rules:
  - given an array of integers
  - find an index N where the sum of the integers to the left of N is equal to
    the sum of the integers to the right of N
  - if there is no index that would make this happen, return -1

Questions:
  - What should the method return if the input array is empty?

Examples:
[1, 2, 3, 4, 3, 2, 1]

index = 0; left = []; right = [2, 3, 4, 3, 2, 1];
left_sum = 0; right_sum = 15

index = 1; left = [1]; right = [3, 4, 3, 2, 1];
left_sum = 1; right_sum = 13

index = 2; left = [1, 2]; right = [4, 3, 2, 1];
left_sum = 2; right_sum = 10

index = 3; left = [1, 2. 3]; right = [3, 2, 1];
left_sum = 6; right_sum = 6

output is index 3

Algorithm:
  - initialise the local variable left_sum to 0
  - initialise the local variable right_sum to 0
  - initialise the local variable index to 0
  - create a loop
    - break if the current index is greater than the length - 1 of the input array
    - reassign the left_sum to reference the sum of an array [...index]
    - reassign the right_sum to reference the sum of an array [index + 1..]
    - if the sums of those arrays are equal, return the index
    - increment index by 1
  - return -1
=end

def find_even_index(arr)
  index = 0

  loop do
    break if index > arr.size - 1

    left_sum = arr[...index].sum
    right_sum = arr[index + 1..].sum

    return index if left_sum == right_sum

    index += 1
  end

  -1
end

p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1 
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3
