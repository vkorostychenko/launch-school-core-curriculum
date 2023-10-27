=begin
Complete the solution so that it returns the number of times the search_text
is found within the full_text. Overlap is not permitted: "aaa" contains 1
instance of "aa", not 2.

Usage example:

full_text = "aa_bb_cc_dd_bb_e", search_text = "bb"
    ---> should return 2 since "bb" shows up twice


full_text = "aaabbbcccc", search_text = "bbb"
    ---> should return 1
=end

=begin
Input: two strings
Output: a number

Rules:
  - give two strings: full_text and search_text
  - return the number of times the search_text is found within the full_text
  - overlap is not permitted
  
Algorithm:
  - initialise the local variable counter to 0
  - while full_text includes the search_text
    - substitute the first instance of the search_text within the full_text with
      an empty string
      - reassign the full_text to reference a new substituted string
      - reassign the counter to counter incremented by 1
  - return counter
=end

def solution(full_text, search_text)
  counter = 0

  while full_text.include?(search_text)
    full_text = full_text.sub(search_text, '')
    counter += 1
  end
  
  counter
end

p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1
