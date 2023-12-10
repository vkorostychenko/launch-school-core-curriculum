=begin
Difficulty: medium

Sherlock has to find suspects on his latest case. He will use your method, dear 
Watson. Suspect in this case is a person which has something not allowed in 
his/her pockets.

Allowed items are defined by array of numbers.

Pockets contents are defined by map entries where key is a person and value is 
one or few things represented by an array of numbers (can be nil or empty array 
if empty), 
  
Example of pockets:
  
  pockets = { 
    bob: [1],
    tom: [2, 5],
    jane: [7]
  } 
  
Write a method that helps Sherlock to find suspects. If no suspect is found or 
there are no pockets (pockets == nil), the method should return nil.

Input: a hash and an array
Output: nil or an array

Rules:
  - given a hash containing a person as a key and and their pocket as a value (array)
  - and given an array containing items that are allowed
  - return a list (an array) of suspects or nil if there are not any
    - suspect is a person who has smth NOT allowed in their pocket

Algorithm:
  - given a hash and an array
  - iterate through the hash for rejection
    - reject the current person if:
      - their pocket is empty or nil
      - their pocket contains only the items that are allowed
  - if the selected hash of suspects is empty
    - return nil
  - otherwise, return an array of keys from the hash of selected suspects
=end

def find_suspects(pockets, items)
  suspects = pockets.reject do |person, pocket|
    if !pocket || pocket.empty?
      true
    else
      pocket.all? { |item| items.include?(item) }
    end
  end

  suspects.empty? ? nil : suspects.keys
end


pockets = {}
p find_suspects(pockets, [1, 3]) == nil

pockets = { tom: [2], bob: [2], julia: [3], meg: [3] }
p find_suspects(pockets, [2, 3]) == nil

pockets = { julia: nil, meg: [] }
p find_suspects(pockets, [1, 6]) == nil

pockets = { meg: [3], tom: [5] }
p find_suspects(pockets, []) == [:meg, :tom]

pockets = { meg: [1, 3], tom: [5, 3] }
p find_suspects(pockets, [1, 3]) == [:tom]
