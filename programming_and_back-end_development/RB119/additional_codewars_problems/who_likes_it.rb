=begin
Difficulty: ___

You probably know the "like" system from Facebook and other pages. People can "like" 
blog posts, pictures or other items. We want to create the text that should be 
displayed next to such an item.

Implement a function likes :: [String] -> String, which must take in input array, 
containing the names of people who like an item. It must return the display text as 
shown in the examples:

likes [] // must be "no one likes this"
likes ["Peter"] // must be "Peter likes this"
likes ["Jacob", "Alex"] // must be "Jacob and Alex like this"
likes ["Max", "John", "Mark"] // must be "Max, John and Mark like this"
likes ["Alex", "Jacob", "Mark", "Max"] // must be "Alex, Jacob and 2 others like this"

Input: an array
Output: a string

Rules:
  - given an array of names
  - return a string with an appropriate formatting:
    - if the array is empty -> "no one likes this"
    - if the array contains one name -> "#{name} likes this"
    - if the array contains two names -> "#{name1} and #{name2} like this"
    - if the array contains three names -> "#{name1}, #{name2} and #{name3} like this"
    - if the array contains more than three names:
      - return "#{name1}, #{name2} and #{count names - 2} others like this"

Algorithm:
  - given an array
  - check the length of the array and begin a case statement
    - when the length is 0 then return "no one likes this"
    - when the length is 1 then return "#{name} likes this"
    - when the length is 2 then return "#{name1} and #{name2} like this"
    - when the length is 3 then return "#{name1}, #{name2} and #{name3} like this"
    - when the length is greater than 3 then
      - return "#{name1}, #{name2} and #{count names - 2} others like this"
=end

def likes(names)
  case names.count
  when 0 then "no one likes this"
  when 1 then "#{names.first} likes this"
  when 2 then "#{names[0]} and #{names[1]} like this"
  when 3 then "#{names[0]}, #{names[1]} and #{names[2]} like this"
  else        "#{names[0]}, #{names[1]} and #{names.count - 2} others like this"
  end
end

p likes([]) == 'no one likes this'
p likes(['Peter']) == 'Peter likes this'
p likes(['Jacob', 'Alex']) == 'Jacob and Alex like this'
p likes(['Max', 'John', 'Mark']) == 'Max, John and Mark like this'
p likes(['Alex', 'Jacob', 'Mark', 'Max']) == 'Alex, Jacob and 2 others like this'
