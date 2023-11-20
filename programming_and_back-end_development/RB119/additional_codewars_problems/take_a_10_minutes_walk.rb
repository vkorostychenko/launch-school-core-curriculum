=begin
Difficulty: medium

You live in the city of Cartesia where all roads are laid out in a perfect grid. 
You arrived ten minutes too early for an appointment, so you decided to take the 
opportunity to go for a short walk. The city provides its citizens with a Walk 
Generating App on their phones -- every time you press the button it sends you
an array of one-letter strings representing directions to walk 
(eg. ['n', 's', 'w', 'e']). You always walk only a single block in a direction 
and you know it takes you one minute to traverse one city block, so create a 
function that will return true if the walk the app gives you will take you 
exactly ten minutes (you don't want to be early or late!) and will, of course, 
return you to your starting point. Return false otherwise.

Note: you will always receive a valid array containing a random assortment of 
direction letters ('n', 's', 'e', or 'w' only). It will never give you an empty 
array (that's not a walk, that's standing still!).

Input: an array
Output: a boolean

Rules:
  - given an array containing a random assortment of directon-letters
    - ('n', 's', 'e', or 'w' only)
    - the input is always a valid array
  - return a boolean true if pairs 'n' == 's' and 'w' == 'e'

Algorithm:
  - given an array
  - return false if the number of elements in the input array is NOT equal to 10
  - count each instruction from the input array and store the result in a hash
  - return true if 'n' == 's' and 'w' == 'e' in the hash
=end

def is_valid_walk(walk)
  return false if walk.count != 10

  tally = walk.tally
  tally['n'] == tally['s'] && tally['w'] == tally['e']
end

p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false
