def running_total(array)
  result = []

  memo = 0
  array.each do |num|
    memo = memo + num
    result << memo
  end

  result
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
