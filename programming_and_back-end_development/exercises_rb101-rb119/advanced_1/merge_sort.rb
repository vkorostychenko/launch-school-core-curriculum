=begin
Sort an array of passed in values using merge sort. You can assume that this
array may contain only one type of data. And that data may be either all numbers
or all strings.

Merge sort is a recursive sorting algorithm that works by breaking down the
array elements into nested sub-arrays, then recombining those nested sub-arrays
in sorted order. It is best shown by example. For instance, let's merge sort the
array [9,5,7,1]. Breaking this down into nested sub-arrays, we get:

[9, 5, 7, 1] ->
[[9, 5], [7, 1]] ->
[[[9], [5]], [[7], [1]]]

We then work our way back to a flat array by merging each pair of nested
sub-arrays:

[[[9], [5]], [[7], [1]]] ->
[[5, 9], [1, 7]] ->
[1, 5, 7, 9]
=end

def merge_sort(arr)
  return arr if arr.size == 1

  mid_idx = arr.size / 2

  first_half_sorted = merge_sort(arr[0...mid_idx])
  second_half_sorted = merge_sort(arr[mid_idx..-1])

  return merge(first_half_sorted, second_half_sorted)
end

def merge(first_half, second_half)
  result = []

  while first_half.size != 0 && second_half.size != 0
    if first_half.first > second_half.first
      result << second_half.shift
    else
      result << first_half.shift
    end
  end
  
  until first_half.empty?
    result << first_half.shift
  end
  
  until second_half.empty?
    result << second_half.shift
  end
  
  result
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) ==
  %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) ==
  [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
