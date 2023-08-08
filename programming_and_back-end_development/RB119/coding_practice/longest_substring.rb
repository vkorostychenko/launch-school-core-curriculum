=begin
Find the longest substring in alphabetical order.
Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
The input will only consist of lowercase characters and will be at least one letter long.
If there are multiple solutions, return the one that appears first.

The PEDAC process

P: Understanding the Problem
  - Explicit requirements:
    - Input: string
      - only lowercase letters
      - at least one letter long
    - Output: new string
      - the longest substring in alphabetical order
      - if there are multiple solutions, return the one that appears first
  - Implicit requirements:
  - Questions:

E: Examples and Test Cases:
  - longest('asd') == 'as'
  - longest('nab') == 'ab'
  - longest('abcdeapbcdef') ==  'abcde'
  - longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
  - longest('asdfbyfgiklag') == 'fgikl'
  - longest('z') == 'z'
  - longest('zyba') == 'z'

D: Data Structure:
A: Algorithm:
  - initialise a local variable 'longest_sub' to an empty string

  - outer iterator will step through all the possible subarray lengths of 
    the input array
    - inner iterator will step through each index of the input array
      - if a current substring is smaller than the current iterator value
         - skip to the next iteration
      - if a current substring is longer than the 'longest_sub' and is in
        alphabetical order
        - reassign the 'longest_sub' to the current value

  - check whether the string is in alphabetical order
    - compare self to sorted self

  - return the 'longest_sub'

C: Code:
=end

def alphabetical_order?(str)
  str.chars == str.chars.sort
end

def longest(str)
  longest_sub = ''

  (1..str.size).each do |sub_length|
    (0...str.size).each do |start_idx|
      sub = str[start_idx, sub_length]
      next if sub.size < sub_length

      if longest_sub.size < sub.size && alphabetical_order?(sub)
        longest_sub = sub
      end
    end
  end

  longest_sub
end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') ==  'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'
