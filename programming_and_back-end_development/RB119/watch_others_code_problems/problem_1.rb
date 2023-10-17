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

p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabc") == true
