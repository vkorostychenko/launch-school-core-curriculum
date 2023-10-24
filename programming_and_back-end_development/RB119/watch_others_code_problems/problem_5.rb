=begin
Write a method to find the longest common prefix string amongst an array of
strings. If there is no common prefix, return an empty string "".

Example 1:
Input: ["flower", "flow", "flight"]
Output: "f1"

Example 2:
Input: ["dog", "racecar", "car"]
Output: ""
Explanation: There is no common prefix among the input strings.

Note: All given inputs are in lowercase letters a-z.
=end

=begin
Input: an array of strings
Output: a string

Rules:
  - find the longest common prefix string amongst an array of strings
  - if there is no common prefix, return an empty string ""
  - prefix should be at least 2 characters long
  - all given inputs are in lowercase letters a-z

Algorithm:
  - initialise a local variable longest_prefix to an empty string
    - iterate from 1 up to the length of the first word - 1
      - slice the first word [0..current_idx]
      - if all words in the input array start with the current prefix
        - reassign the longest_prefix to the current prefix
      - else
        - break
      - end
    end
    -return the longest_string
=end

def common_prefix(arr)
  longest_prefix = ''

  (1...arr.first.size).each do |idx|
    current_prefix = arr.first[0..idx]

    if arr.all? { |word| word.start_with?(current_prefix) }
      longest_prefix = current_prefix
    else
      break
    end
  end

  longest_prefix
end

p common_prefix(["flower", "flow", "flight"]) == "fl"
p common_prefix(["dog", "racecar", "car"]) == ""
p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
p common_prefix(["throne", "dungeon"]) == ""
p common_prefix(["throne", "throne"]) == "throne"
