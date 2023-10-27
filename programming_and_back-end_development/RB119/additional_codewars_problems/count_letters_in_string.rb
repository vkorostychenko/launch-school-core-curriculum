=begin
In this kata, you've to count lowercase letters in a given string and return the
letter count in a hash with 'letter' as key and count as 'value'. The key must
be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.

Example:
letterCount('arithmetics')
#=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

=end

=begin
Input: a string
Output: a hash

Rules:
  - count lowercase letters in a given string
  - return the letter count in a hash where 'letter' is key and count is 'value'
  - the key must be a 'symbol'
  - return an empty hash if the given string is empty

Algorithm:
  - convert a string into an array of unique characters
  - iterate over an array with a result object (the object is an empty hash)
    - assign the current character converted to a symbol as a key and the number
      of occurrences of the current character in the input string as a value
  - return the result object
=end

def count_chars(s)
  s.chars.uniq.each_with_object({}) do |char, result|
    result[char.to_sym] = s.count(char)
  end
end

p count_chars('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p count_chars('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p count_chars('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
