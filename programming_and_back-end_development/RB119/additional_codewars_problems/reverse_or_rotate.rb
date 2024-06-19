=begin
Difficulty: ___

The input is a string str of digits. Cut the string into chunks (a chunk here is
a substring of the initial string) of size sz (ignore the last chunk if its size
is less than sz).

If a chunk represents an integer such as the sum of the cubes of its digits is
divisible by 2, reverse that chunk; otherwise rotate it to the left by one
position. Put together these modified chunks and return the result as a string.

If sz is <= 0 or if str is empty return ""
If sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".

Examples:

  revrot("123456987654", 6) --> "234561876549"
  revrot("123456987653", 6) --> "234561356789"
  revrot("66443875", 4) --> "44668753"
  revrot("66443875", 8) --> "64438756"
  revrot("664438769", 8) --> "67834466"
  revrot("123456779", 8) --> "23456771"
  revrot("", 8) --> ""
  revrot("123456779", 0) --> "" 
  revrot("563000655734469485", 4) --> "0365065073456944"

Input: a string and an integer
Output: a string

Rules:
  - given a string and an integer
  - find all substrings of the length of sz
    - (ignore the last chunk if its size is less than sz)
  - reverse the substring if
    - the sum of the cubes of its digits is divisible by 2
  - otherwise rotate it to the left by one position
  - join together the substrings and return the result

  - If sz is <= 0 or if str is empty return ""
  - If sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".

Algorithm:
  - given a string str and an integer sz
  - return '' if sz is LESS or equals to 0
  - return '' if sz is GREATER of the length of the string
  - convert the string into an array of digits
  - find all substrings of the length of sz and ingnore the last substring if its size is less than sz
  - iterate through the substrings for transformation
    - if the sum of the cubes of its digits is divisible by 2
      - reverse the current substring
    - else rotate it to the left by one position
  - join together the transformed array of substrings and retrun the result
=end

def revrot(str, sz)
  return '' if sz == 0 || sz > str.size

  substrings = str.chars.map(&:to_i).each_slice(sz).reject do |subarr|
                subarr.size < sz
              end

  substrings.map do |subarr|
    sum_cubes = subarr.sum { |digit| digit ** 3 }

    if sum_cubes.even?
      subarr.reverse
    else
      temp = subarr.shift
      subarr << temp
      subarr
    end
  end.flatten.join
end

p revrot("1234", 0) == ""
p revrot("", 0) == ""
p revrot("1234", 5) == ""
p revrot("733049910872815764", 5) == "330479108928157"
p revrot("123456987654", 6) == "234561876549"
p revrot("123456987653", 6) == "234561356789"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("", 8) == ""
p revrot("123456779", 0) == ""
p revrot("563000655734469485", 4) == "0365065073456944"
