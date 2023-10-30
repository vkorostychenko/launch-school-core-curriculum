=begin
Given a string of integers, return the number of odd-numbered substrings that
can be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total
of 7 numbers.

solve("1341") = 7

Input: a string
Output: an integer

Rules:
  Explicit:
    - given a string of integers
    - return the number of odd-numbered substrings that can be formed
  Implicit:
    - take into account only the contiguous substrings
    
Algorithm:
  - initialise the local variable count to 0
  - outer iterator will iterate through each index of the input string
    - inner iterator will iterate from the current index of the outer iterator
      up to the last index of the input string
      - slice the input string from the outer index to the inner index
      - convert the created substring to an integer
      - increment count by 1 if the current substring is odd
  - return count
=end

def solve(s)
  count = 0

  (0...s.size).each do |start_idx|
    (start_idx...s.size).each do |end_idx|
      count += 1 if s[start_idx..end_idx].to_i.odd?
    end
  end

  count
end


p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28
