=begin
Find the length of the longest substring in the given string that is the same in
reverse.
As an example, if the input was "I like racecars that go fast", the substring
(racecar) length would be 7.
If the length of the input string is 0, return value must be 0.

Example:
"а" -> 1
"aab" -> 2
"abcde" -> 1
"zzbaabcd" -> 4
"" -> 0
=end

=begin
Input: a string
Output: a number

Rules:
  - find the length of the longest substring in the given string that is the
    same in reverse (palindrome)
  - return 0 if the length of the substring is 0

Algorithm:
  - return 0 if the input string is empty
  - initialise the local variable to store all the palindrome substrings
  - outer iterator will iterate through each index of the input string
    - inner iterator will iterate starting from the current outer index up to
      the length of the input string - 1
      - slice the input string [start_index..end_index]
      - if the sliced substring is a palindrome
        - append its length to the palindromes length array
  - return max value from palindrome lengths
=end

def longest_palindrome(str)
  return 0 if str.empty?

  palindromes_length = []

  (0...str.size).each do |start_idx|
    (start_idx...str.size).each do |end_idx|
      substr = str[start_idx..end_idx]

      if substr == substr.reverse
        palindromes_length << substr.size
      end
    end
  end

  palindromes_length.max
end

p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9
