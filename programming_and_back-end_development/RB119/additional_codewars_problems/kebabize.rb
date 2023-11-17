=begin
Difficulty: medium

Modify the kebabize function so that it converts a camel case string into a 
kebab case.

kebabize('camelsHaveThreeHumps') // camels-have-three-humps
kebabize('camelsHave3Humps') // camels-have-humps

Notes:
the returned string should only contain lowercase letters

Input: a string
Output: a string

Rules:
  - Explicit:
    - given a string in camelCase
    - return the string in kebab-case
  - Implicit:
    - ignore everything that is NOT an alphabet letter


Algorithm:
  - given a string
  - delete everything that is NOT an alphabet letter (a-z, A-Z)
  - split the string before capital letters into an array of words
  - downcase each word
  - join words into a string with the '-' and return it
=end

def kebabize(str)
  str = str.gsub(/[^a-z]/i, '')
  
  str.split(/(?=[A-Z])/).map(&:downcase).join('-')
end

p kebabize('myCamelCasedString') #== 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') #== 'my-camel-has-humps'
