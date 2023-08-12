=begin
Write a method that returns a list of all substrings of a string that start at
the beginning of the original string. The return value should be arranged in
order from shortest to longest substring.
=end

def leading_substrings(str)
  (0...str.size).map { |sub_length| str[0..sub_length] }
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
