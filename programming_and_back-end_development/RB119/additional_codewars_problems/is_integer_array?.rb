=begin
Difficulty: ___

Write a function with the signature shown below:

def is_int_array(arr)
  true
end

returns true / True if every element in an array is an integer or a float with no decimals.
returns true / True if array is empty.
returns false / False for every other input.

Input: an object (array, nil, "")
Output: a boolean

Rulse:
  - given an object
  - returns true if every element in an array is an integer or a float with
    no decimals
  - returns true if array is empty
  - returns false for every other input

Algorithm:
  - given an object
  - return false if the given object is nil OR is not an array OR an array
    containing nil
  - iterate through the array to check if all the elements are an integer or
    a float with no decimals
=end


def is_int_array(obj)
  return false if !obj || obj.class != Array

  obj.all? { |el| el.to_i == el }
end

p is_int_array([]) == true # "Input: []"
p is_int_array([1, 2, 3, 4]) == true # "Input: [1, 2, 3, 4]"
p is_int_array([-11, -12, -13, -14]) == true # "Input: [-11, -12, -13, -14]"
p is_int_array([1.0, 2.0, 3.0]) == true # "Input: [1.0, 2.0, 3.0]"
p is_int_array([1, 2, nil]) == false # "Input: [1,2, nil]"
p is_int_array(nil) == false # "Input: nil"
p is_int_array("") == false # "Input: ''"
p is_int_array([nil]) == false # "Input: [nil]"
p is_int_array([1.0, 2.0, 3.0001]) == false # "Input: [1.0, 2.0, 3.0001]"
p is_int_array(["-1"]) == false # "Input: ['-1']"
