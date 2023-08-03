=begin
You are given a method named spin_me that takes a string as an argument and
returns a string that contains the same words, but with each word's characters
reversed. Given the method's implementation, will the returned string be the
same object as the one passed in as an argument or a different object?
=end

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

str = "hello world"
p str.object_id # 60
p spin_me(str).object_id # 80

# The method will return a different object.
