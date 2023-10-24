=begin
Given an array of strings made only from lowercase letters, return an array of
all characters that show up in all strings within the given array (including
duplicates).
For example, if a character occurs 3 times in all strings but not 4 times, you
need to include that character three times in the final answer.
=end

=begin
Input: an array of strings
Output: an array of characters

Rules:
  - The input array consists of words made of only lowercase letters
  - Return an array of all characters that show up in all strings within the
    given array
  - If there are duplicates, include them too

Questions:
  - Does the order of occurrence of shared letters matter?

Algorithm:
  - sort the input array by the length of words within it
  - initialise the output array
  - delete the first element which is the shortest word and iterate over it
    - iterate over the sorted input array
      - if all the words include the current character
        - iterate over each word
          - find the index at which the current character is and delete it
            - split the word into an array containing each character as the
              separate element
            - find the index at which the current character is and delete it
            - convert this array into a string
            - destructively replace the word  within this string
        - store the current character in the output array
      - else next iteration
  - return the output array
=end

def common_chars(arr)
  arr = arr.sort_by(&:size)
  shortest_word = arr.shift
  result = []

  shortest_word.each_char do |char|
    if arr.all? { |word| word.include?(char) }
      arr.map! do |word|
        word = word.chars
        word.delete_at(word.index(char))
        word.join
      end

      result << char
    else
      next
    end
  end

  result
end

p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []
