# How would you order this array of hashes based on the year of publication
# of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

sorted_books = books.sort_by do |book|
                 book[:published].to_i
               end

puts sorted_books

# {:title=>"War and Peace", :author=>"Leo Tolstoy", :published=>"1869"}
# {:title=>"Ulysses", :author=>"James Joyce", :published=>"1922"}
# {:title=>"The Great Gatsby", :author=>"F. Scott Fitzgerald", :published=>"1925"}
# {:title=>"One Hundred Years of Solitude", :author=>"Gabriel Garcia Marquez", :published=>"1967"}
