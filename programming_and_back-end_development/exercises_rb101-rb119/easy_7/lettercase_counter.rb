=begin
Write a method that takes a string, and then returns a hash that contains 3
entries: one represents the number of characters in the string that are
lowercase letters, one represents the number of characters that are uppercase
letters, and one represents the number of characters that are neither.
=end

def letter_case_count(str)
  result = { lowercase: 0, uppercase: 0, neither:  0 }

  str.each_char do |chr|
    if chr.match?(/[a-z]/)
      result[:lowercase] += 1
    elsif chr.match?(/[A-Z]/)
      result[:uppercase] += 1
    else
      result[:neither] += 1
    end
  end

  result
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
