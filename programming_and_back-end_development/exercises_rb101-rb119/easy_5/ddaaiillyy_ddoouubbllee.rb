=begin
Write a method that takes a string argument and returns a new string that
contains the value of the original string with all consecutive duplicate
characters collapsed into a single character. You may not use String#squeeze or
String#squeeze!.
=end

def crunch(str)
  new_str = ''
  str.each_char do |chr|
    new_str << chr if new_str[-1] != chr
  end
  new_str
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
