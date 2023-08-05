=begin
What will the following code print, and why? Don't run the code until you have
tried to answer.
=end

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

=begin
The output is:
Moe
Larry
CURLY
SHEMP
Harpo
CHICO
Groucho
Zeppo

Those changes happened because, even though `array1` and `array2` are different
objects, their elements reference the same objects. Thus making changes to either
array element, we simply change the original object, and those changes appear
in another array.
=end
