=begin
Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:

game = GuessingGame.new
game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!

game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guess remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!

Note that a game object should start a new game with a new number to guess with each call to #play.
=end

class GuessingGame
  GUESSES = 7
  RANGE = 1..100

  def initialize
    @secret_number = nil
  end

  def play
    reset
    GUESSES.downto(1) do |remaining_guesses|
      puts "You have #{remaining_guesses} guesses remaining."
      guess = prompt_number

      if guess < @secret_number
        puts 'Your guess is too low.'
        puts ''
      elsif guess > @secret_number
        puts 'Your guess is too high.'
        puts ''
      else
        puts "That's the number!"
        puts ''
        return puts 'You won!'
      end
    end
    puts 'You have no more guesses. You lost!'
  end

  private

  def prompt_number
    print "Enter a number between #{RANGE.first} and #{RANGE.last}: "
    loop do
      number = gets.chomp.to_i
      return number if RANGE.cover?(number)

      puts 'Invalid guess.'
    end
  end

  def reset
    @secret_number = rand(RANGE)
  end
end

game = GuessingGame.new
game.play
