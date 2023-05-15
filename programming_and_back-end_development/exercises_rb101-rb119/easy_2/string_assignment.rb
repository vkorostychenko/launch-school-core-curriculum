name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

=begin
This code will print out a string 'BOB' two times.
Local variable 'name' is initialized, and the value 'Bob' is assigned to it on line 1.
On line 2, the local variable 'save_name' is initialized and references the same object 'Bob' as the variable 'name'.
On line 3, the destructive method '.upcase!' is called on the local variable 'name'. 
Since a string object in Ruby is mutable, its value has changed to 'BOB'.
On line 4, the method 'puts' is called and passed the 'name' and 'save_name' as arguments.
Since 'name' and 'save_name' reference the same object this invocation will output 'BOB' two times and return 'nil'.
=end