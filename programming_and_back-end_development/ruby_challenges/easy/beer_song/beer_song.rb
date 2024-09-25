# Write a program that can generate the lyrics of the 99 Bottles of Beer song.
# See the test suite for the entire song.

class BeerSong
  def self.lyrics
    verses(99, 0)
  end

    def self.verse(bottles)
      case bottles
      when 2
        "2 bottles of beer on the wall, 2 bottles of beer.\n" \
        "Take one down and pass it around, 1 bottle of beer on the wall.\n"
      when 1
        "1 bottle of beer on the wall, 1 bottle of beer.\n" \
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
      when 0
        "No more bottles of beer on the wall, no more bottles of beer.\n" \
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      else
        "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" \
        "Take one down and pass it around, #{bottles - 1} bottles of beer on the wall.\n"
      end
    end

    def self.verses(top, bottom)
      output = []
      top.downto(bottom) { |line| output << verse(line) }
      output.join("\n")
    end
end
