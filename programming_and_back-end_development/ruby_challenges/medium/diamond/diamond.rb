# The diamond exercise takes as its input a letter, and outputs it in a diamond shape.
# Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

#     The first row contains one 'A'.
#     The last row contains one 'A'.
#     All rows, except the first and last, have exactly two identical letters.
#     The diamond is horizontally symmetric.
#     The diamond is vertically symmetric.
#     The diamond has a square shape (width equals height).
#     The letters form a diamond shape.
#     The top half has the letters in ascending order.
#     The bottom half has the letters in descending order.
#     The four corners (containing the spaces) are triangles.

# Examples

# Diamond for letter 'A':

# A

# Diamond for letter 'C':

#   A
#  B B
# C   C
#  B B
#   A

# Diamond for letter 'E':

#     A    
#    B B   
#   C   C  
#  D     D 
# E       E
#  D     D 
#   C   C  
#    B B   
#     A    

# "...A..." 0 spaces
# "..B.B.." 1
# ".C...C." 3
# "D.....D" 5 main raw == width
# ".C...C." 3
# "..B.B.." 1
# "...A..." 0

class Diamond
  ALPHABET = ('A'..'Z').to_a

  def self.make_diamond(letter)
    range = ('A'..letter).to_a + ('A'...letter).to_a.reverse
    width = number_of_spaces(range.max) + 2

    return "#{letter}\n" if range.one? # for letter 'A'

    range.each_with_object([]) do |current_letter, array|
      row = build_row(current_letter).center(width)
      array << row
    end.join("\n") + "\n"
  end

  class << self
    private

    def number_of_spaces(letter)
      index = ALPHABET.index(letter.upcase)
      return 0 if index.zero?

      (index * 2) - 1
    end

    def build_row(letter)
      if letter == 'A'
        letter
      else
        spaces_between = ' ' * number_of_spaces(letter)
        "#{letter}#{spaces_between}#{letter}"
      end
    end
  end
end
