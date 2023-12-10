=begin
Difficulty: medium

The marketing team is spending way too much time typing in hashtags.
Let's help them with our own Hashtag Generator!

Here's the deal:

It must start with a hashtag (#).
All words must have their first letter capitalized.
If the final result is longer than 140 chars it must return false.
If the input or the result is an empty string it must return false.

Examples
" Hello there thanks for trying my Kata"  =>  "#HelloThereThanksForTryingMyKata"
"    Hello     World   "                  =>  "#HelloWorld"
""                                        =>  false

Input: a string
Output: a boolean false or a string

Rules:
  - given a string
  - return a string that is looks like a hash tag
    - It must start with a hashtag (#).
    - All words must have their first letter capitalized.
    - If the final result is longer than 140 chars it must return false.
    - If the input or the result is an empty string it must return false.

Implicit:
  - consider only a-z A-Z

Algorithm:
  - given a string
    # - if the final result is longer than 140 chars
  - split the string into an array of words
  - iterate through the array of words for transformation
  - transform each word into its capitalized version
  - join the words together into a string
  - add the pound sign to the front of the string
  - if the result string is not containing only the pound sign AND its length is Not greater than 140 chars
    - return the result
  - otherwise return false

=end

def generateHashtag(str)
  hashtag = '#' << str.scan(/[a-z]+/i).map(&:capitalize).join

  hashtag.size.between?(2, 140) ? hashtag : false
end



p generateHashtag("") == false
p generateHashtag(" " * 200) == false
p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag"
p generateHashtag("Codewars") == "#Codewars"
p generateHashtag("Codewars Is Nice") ==  "#CodewarsIsNice"
p generateHashtag("Codewars is nice") == "#CodewarsIsNice"
p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
p generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false
p generateHashtag("a" * 139) == "#A" + "a" * 138
p generateHashtag("a" * 140) == false
