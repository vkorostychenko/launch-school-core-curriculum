=begin
For a given nonempty string s find a minimum substring t and the maximum
number k, such that the entire string s is equal to t repeated k times.

The input string consists of lowercase Latin letters.

Your function should return an array [t, k]

Examples:

"ababab" ---> (t = "ab", k = 3)

"abcde" ---> (t = "abcde", k = 1)
because for this string, the minimum substring 't'
such that 's' is 'k' times 't', is 's' itself.

Input: a string
Output: an array

Rules:
  - given nonempty string
  - find a minimum substring t and the multiple k, to produce the input string
  - return an array containing the input string and an integer 1 if no minimum
    substrings are found

Algorithm:
  - iterate over each index
    - slice the input string from 0 up to the current index and assign the
      return value to a local variable substring
    - find multiple by dividing the input string length by the length of the
      current substring
    - return an array containing the current substring and the multiple if their
      product equals the input string
=end


def f(str)
  (0...str.size).each do |end_idx|
    substring = str[0..end_idx]
    multiple = str.size / substring.size

    return [substring, multiple] if substring * multiple == str
  end
end

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]
