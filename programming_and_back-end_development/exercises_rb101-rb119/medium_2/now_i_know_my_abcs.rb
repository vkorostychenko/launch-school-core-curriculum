=begin
A collection of spelling blocks has two letters per block, as shown in this
list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do
not use both letters from any given block. Each letter in each block can only
be used once.

Write a method that returns true if the word passed in as an argument can be
spelled from this set of blocks, false otherwise.
=end

SPELLING_BLOCKS = [
                    'BO', 'XK', 'DQ', 'CP', 'NA', 
                    'GT', 'RE', 'FS', 'JW', 'HU',
                    'VI', 'LY', 'ZM',
                  ]

def block_word?(word)
  SPELLING_BLOCKS.each do |block|
    matched = 0

    block.each_char do |char|
      matched += 1 if word.match?(/#{char}/i)
    end

    return false if matched > 1
  end

  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
