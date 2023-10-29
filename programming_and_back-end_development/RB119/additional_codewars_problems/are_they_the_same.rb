=begin
Given two arrays a and b write a function comp(a, b) (orcompSame(a, b)) that
checks whether the two arrays have the "same" elements, with the same
multiplicities (the multiplicity of a member is the number of times it appears).
"Same" means, here, that the elements in b are the elements in a squared,
regardless of the order.

Examples
Valid arrays

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]

comp(a, b) returns true because in b 121 is the square of 11, 14641 is the
square of 121, 20736 the square of 144, 361 the square of 19, 25921 the square
of 161, and so on. It gets obvious if we write b's elements in terms of squares:

a = [121, 144, 19, 161, 19, 144, 19, 11] 
b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]

Invalid arrays

If, for example, we change the first number to something else, comp is not
returning true anymore:

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]

comp(a,b) returns false because in b 132 is not the square of any number of a.

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]

comp(a,b) returns false because in b 36100 is not the square of any number of a.

If a or b are nil (or null or None, depending on the language), the problem
doesn't make sense so return false.

Input: two arrays
Output: a boolean

Rules:
  - given two arrays array1 and array2
  - check whether the two arrays have the 'same' elements
    ('same' means that the elements in array2 are the elements in array1 squared,
    regardless of the order)
  - return false if one of the input arrays is nil or false or they have
    different lengths

Questions:
  - What should this method return if both arrays are empty?

Algorithm:
  - return false if !array1 or !array2 or array1.size != array2.size
  - iterate over array1 for transformation
    - square each element
  - sort transformed array1
  - sort array2
  - return result of the comparison of these two arrays
=end

def comp(array1, array2)
  return false if !array1 || !array2 || array1.size != array2.size
  
  array1.map { |num| num * num }.sort == array2.sort
end

p comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361]) == true
p comp([121, 144, 19, 161, 19, 144, 19, 11], [132, 14641, 20736, 361, 25921, 361, 20736, 361]) == false
