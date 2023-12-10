=begin
Difficulty: ___

Given: an array containing hashes of names

Return: a string formatted as a list of names separated by commas except for
the last two names, which should be separated by an ampersand.

Example:

list([ {name: 'Bart'}, {name: 'Lisa'}, {name: 'Maggie'} ])
# returns 'Bart, Lisa & Maggie'

list([ {name: 'Bart'}, {name: 'Lisa'} ])
# returns 'Bart & Lisa'

list([ {name: 'Bart'} ])
# returns 'Bart'

list([])
# returns ''

Note: all the hashes are pre-validated and will only contain A-Z, a-z, '-' and '.'.

Input: an array
Output: a string

Rules:
  - given an array of hashes
  - return a list of names as a string separated by a comma; the last name
    should be separated by ampersand

Algorithm:
  - given an array of hashes
  - iterate through the array for transformation
    - hash[:name]
  - reference the names from index 0 up to -2
  - join the received array together with ', '
  - add ' &#{last element}'
  - return the result
=end

def list(arr)
  names = arr.map { |hash| hash[:name] }

  names.one? ? names.first : names[0..-2].join(', ') + " & #{names.last}"
end

p list([{name: 'Bart'},{name: 'Lisa'},{name: 'Maggie'},{name: 'Homer'},{name: 'Marge'}]) == 'Bart, Lisa, Maggie, Homer & Marge' # "Must work with many names"
p list([{name: 'Bart'},{name: 'Lisa'}]) == 'Bart & Lisa'# "Must work with two names"
p list([{name: 'Bart'}]) == 'Bart'
