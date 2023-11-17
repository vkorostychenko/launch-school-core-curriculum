=begin
Difficulty: ___

Write a function that when given a URL as a string, parses out just the domain 
name and returns it as a string. 

For example:

domain_name("http://github.com/carbonfive/raygun") == "github" 
domain_name("http://www.zombie-bites.com") == "zombie-bites"
domain_name("https://www.cnet.com") == "cnet"

Input: a string
Output: a string

Rules:
  - given a URL as a string
  - return a domain name extracted from the input as a string

Algorithm:
  - given a string
  - create an array of prefixes
  - iterate over the array of prefixes
    - if the input string includes the current prefix
      - delete the prefix from the input string and reassign url
  - split url string by '.' and return the first element
=end

def domain_name(url)
  prefixes = ['http://', 'https://', 'www.']

  prefixes.each do |prefix|
    url = url.delete_prefix(prefix) if url.include?(prefix)
  end

  url.split('.').first
end

p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"
