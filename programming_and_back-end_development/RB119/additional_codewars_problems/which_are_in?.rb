=begin
Difficulty: ___

Given two arrays of strings a1 and a2 return a sorted array r in lexicographical (alphabetical)
order of the strings of a1 which are substrings of strings of a2.

Example 1: 

a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
  returns ["arp", "live", "strong"]


Example 2: 

a1 = ["tarp", "mice", "bull"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
  returns []


Notes:

Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.
In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.

Don't mutate the inputs.

Input: two arrays
Output: an array

Rules:
  - given two arrays
  - return an array containing selected strings from a1 that match at least once in a2
  - don't mutate the input

Algorithm:
  - given two arrays
  - iterate through the a1 for selection
    - iterate through the a2
      - if the current element in a2 matches the current element in a1
       - select this element
  - return the array of selected elements
=end


def in_array(arr1, arr2)
  arr1.select do |substr|
    arr2.any? do |str|
      str.include?(substr)
    end
  end
end

a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

p in_array(a1, a2) == ["arp", "live", "strong"]

a1 = ["tarp", "mice", "bull"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

p in_array(a1, a2) == []
