=begin
Write a method that returns a list of all substrings of a string. The returned
list should be ordered by where in the string the substring begins. This means
that all substrings that start at position 0 should come first, then all
substrings that start at position 1, and so on. Since multiple substrings will
occur at each position, the substrings at a given position should be returned in
order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in the previous
exercise:
=end

def substrings(str)
  substrings = []

  (0...str.size).each do |start_idx|
    (start_idx...str.size).each do |sub_length|
      substrings << str[start_idx..sub_length]
    end
  end

  substrings
end

p substrings('abcde') == [
    'a', 'ab', 'abc', 'abcd', 'abcde',
    'b', 'bc', 'bcd', 'bcde',
    'c', 'cd', 'cde',
    'd', 'de',
    'e'
  ]
