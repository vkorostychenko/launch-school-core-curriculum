=begin
A substring is a contiguous (non-empty) sequence of characters within a string.
  
A vowel substring is a substring that only consists of vowels
('a', 'e', 'i', 'o', and 'u') and has all five vowels present in it.
  
Given a string word, return the number of vowel substrings in the word.

p count_vowel_substrings("abcde") == 0
p count_vowel_substrings("cuaieuouac") == 7
p count_vowel_substrings("aeiouu") == 2
p count_vowel_substrings("unicornarihan") == 0

The PEDAC process

P: Understanding the Problem
  - Explicit requirements:
    - Input: string
    - Output: integer
      - number of vowel substrings in word
  - Implicit requirements:
  - Questions:
    - Should we consider uppercase letters?

E: Examples and Test Cases:
  - p count_vowel_substrings("abcde") == 0
  - p count_vowel_substrings("cuaieuouac") == 7
  - p count_vowel_substrings("aeiouu") == 2
  - p count_vowel_substrings("unicornarihan") == 0
D: Data Structure:
A: Algorithm:
  - initialise a local variable 'count' to 0
  - initialise a local variable 'vowels' to ["a", "e", "i", "o", "u"]
  - outer iterator will step through all the possible substring lengths of 
    the input string
    - inner iterator will step through each index of the input string
      - if a current substring is smaller than the current iterator value
         - skip to the next iteration
      - if the current substring match all the vowels (a,e,i,o,u)
        - increment 'count' by 1
  - return 'count'
C: Code:
=end

def count_vowel_substrings(str)
  count = 0
  vowels = ["a", "e", "i", "o", "u"]
  

  (1..str.size).each do |sub_length|
    (0...str.size).each do |start_index|
      sub = str[start_index, sub_length]
      next if sub.size < sub_length

      count += 1 if sub.chars.sort.uniq == vowels
    end
  end

  count
end

p count_vowel_substrings("abcde") == 0
p count_vowel_substrings("cuaieuouac") == 7
p count_vowel_substrings("aeiouu") == 2
p count_vowel_substrings("unicornarihan") == 0
