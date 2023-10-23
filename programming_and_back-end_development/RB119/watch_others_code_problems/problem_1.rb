=begin
Given a non-empty string check if it can be constructed by taking a substring of
it and appending multiple copies of the substring together. You may assume the
given string consists of lowercase English letters only.

Example 1:

Input: "abab"
Output: True
Explanation: It's the substring "ab" twice.

Example 2:
Input: "aba"
Output: False
=end

=begin
Input: a string
Output: a boolean

Rules:
  - check if a string can be constructed by adding one of its substrings
    multiple times to construct the given string
  - given string consists of lowercase English letters only

Examples:
"abab" == "ab" + "ab"
"abaababaab" == "abaab" + "abaab"

Algorithm:
  - outer iterator will iterate through each index of the input string
    - inner iterator will iterate starting from the current index up to the
      string length exclusively
      - slice the input string from the outer index to the inner index
        inclusively
      - if the modulo division of the input string by the length of the current
        substring is equal to 0 and the substring length is less than the length
        of initial string
        - multiply the current substring by the result of the division of the
          input string length by the length of a current substring
        - if the received string is equal to the input string
         - return true
  - return false
=end

def repeated_substring_pattern(str)
  (0...str.size).each do |outer_idx|
    (outer_idx..str.size).each do |inner_idx|
      sub_str = str[outer_idx..inner_idx]

      if str.size % sub_str.size == 0 && sub_str.size < str.size
        multiple = str.size / sub_str.size

        return true if sub_str * multiple == str
      end
    end
  end

  false
end

p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabc") == true
