=begin
Given 2 strings, your job is to find out if there is a substring that appears in
both strings. You will return true if you find a substring that appears in both
strings, or false if you do not. We only care about substrings that are longer
than one letter long.
=end

=begin
Input: two strings
Output: a boolean

Rules:
  - return true if there is a substring that appears in both strings
  - consider only substrings that are longer than one letter long
  - consider uppercase and lowercase letters the same
  - return false if one or both of the substrings is empty

Algorithm:
  - return false if one of the input strings is empty
  - outer iterator will iterate over each index in the first word
   - inner iterator will iterate over each index from the outer index up to the
     length - 1 of the first word 
    - slice the first word [outer_idx..inner_idx] and assign the result to the
      substring
    - if the substring length is greater than 1
      - return true if the second word matches the substring
    - else
      - next
    - end
  - return false
=end

def substring_test(str1, str2)
  return false if str1.empty? || str2.empty?

  (0...str1.size).each do |outer_idx|
    (outer_idx..str1.size).each do |inner_idx|
      substr = str1[outer_idx..inner_idx]

      if substr.size > 1
        return true if str2.match?(/#{substr}/i)
      else
        next
      end
    end
  end

  false
end
p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', '111t') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundofItIsAtrociou') == true
