# Write a program that, given a word, computes the Scrabble score for that word.

# Letter Values

# You'll need the following tile scores:
# Letter 	Value
# A, E, I, O, U, L, N, R, S, T 	1
# D, G 	2
# B, C, M, P 	3
# F, H, V, W, Y 	4
# K 	5
# J, X 	8
# Q, Z 	10

# How to Score

# Sum the values of all the tiles used in each word. For instance,
# lets consider the word CABBAGE which has the following letters and point values:

# 3 points for C
# 1 point for each A (there are two)
# 3 points for B (there are two)
# 2 points for G
# 1 point for E

# Thus, to compute the final total (14 points), we count:

# 3 + 2*1 + 2*3 + 2 + 1
# => 3 + 2 + 6 + 3
# => 5 + 9
# => 14

class Scrabble
  attr_reader :word

  def initialize(word)
    @word = word ? word : ''
  end

  def self.score(word)
    Scrabble.new(word).score
  end

  def score
    total = 0
    word.each_char do |c|
      total += letter_score(c)
    end
    total
  end

  private

  def letter_score(letter)
    case letter
    when /[AEIOULNRST]/i then 1
    when /[DG]/i         then 2
    when /[BCMP]/i       then 3
    when /[FHVWY]/i      then 4
    when /K/i            then 5
    when /[JX]/i         then 8
    when /[QZ]/i         then 10
    else                      0
    end
  end
end
