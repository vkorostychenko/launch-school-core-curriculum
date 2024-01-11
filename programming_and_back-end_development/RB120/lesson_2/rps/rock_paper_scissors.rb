class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
    (paper? && other_move.rock?) ||
    (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
    (paper? && other_move.scissors?) ||
    (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp.strip.capitalize
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

module Displayable
  def display_welcome_message
    puts "Hey #{human.name},"
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_rules
    puts "Whoever reaches #{RPSGame::WIN_SCORE} points first wins."
  end

  def display_goodbye_message
    puts "Thank you for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_moves
    puts "#{human.name} choose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_score
    puts "\n#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
    puts ""
  end

  def display_winner
    if human.move > computer.move
      puts "\n#{human.name} won this round!"
    elsif human.move < computer.move
      puts "\n#{computer.name} won this round!"
    else
      puts "\nIt's a tie!"
    end
  end

  def display_grand_winner
    winner = human.score > computer.score ? human.name : computer.name

    puts "#{winner} is the Grand Winner!"
  end
end

# Game Orcherstration Engine

class RPSGame
  include Displayable

  WIN_SCORE = 3

  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    clear
    display_welcome_message
    pause
    loop do
      loop do
        clear
        display_rules
        display_score
        human.choose
        computer.choose
        display_moves
        display_winner
        update_score
        pause
        break if grand_winner?
      end
      clear
      display_grand_winner
      clear_score
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    answer.downcase == 'y'
  end

  def update_score
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    end
  end

  def grand_winner?
    human.score == WIN_SCORE || computer.score == WIN_SCORE
  end

  def clear_score
    human.score = 0
    computer.score = 0
  end

  def clear
    system 'clear'
  end

  def pause
    sleep(3)
  end
end

RPSGame.new.play
