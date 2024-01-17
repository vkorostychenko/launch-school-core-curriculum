class Move
  VALUES = {
    rock: %w(r rock),
    paper: %w(p paper),
    scissors: %w(sc scissors),
    lizard: %w(l lizard),
    spock: %w(sp spock)
  }

  WINS_AGAINST = {
    rock: [:scissors, :lizard],
    paper: [:rock, :spock],
    scissors: [:paper, :lizard],
    lizard: [:spock, :paper],
    spock: [:scissors, :rock]
  }

  attr_reader :value

  def initialize(value)
    @value = value
  end

  def to_s
    @value
  end

  def >(other_move)
    WINS_AGAINST[@value].include? other_move.value
  end
end

class Player
  attr_accessor :move, :score
  attr_reader :name

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
    @name = n
  end

  def choose
    choice = prompt_choice
    move = Move::VALUES.find do |_, shortcut|
      shortcut.include? choice
    end.first
    self.move = Move.new(move)
  end

  private

  def prompt_choice
    choice = nil
    loop do
      puts "Please choose (r)rock, (p)paper, (sc)scissors," \
           "(l)lizard or (sp)spock:"
      choice = gets.chomp.downcase
      break if Move::VALUES.any? { |_, shortcut| shortcut.include? choice }
      puts "Sorry, invalid choice."
    end
    choice
  end
end

class Computer < Player
  def choose
    self.move = Move.new(choices.sample)
  end

  private

  def choices
    choices = []
    self.class::MOVE_CHANCES.each do |move, chance|
      chance.times { choices << move }
    end
    choices
  end
end

class R2D2 < Computer
  def set_name
    @name = 'R2D2'
  end

  MOVE_CHANCES = {
    rock: 1,
    paper: 0,
    scissors: 0,
    spock: 0,
    lizard: 0
  }
end

class Hal < Computer
  def set_name
    @name = 'Hal'
  end

  MOVE_CHANCES = {
    rock: 1,
    paper: 0,
    scissors: 5,
    spock: 3,
    lizard: 3
  }
end

class Chappie < Computer
  def set_name
    @name = 'Chappie'
  end

  MOVE_CHANCES = {
    rock: 5,
    paper: 5,
    scissors: 5,
    spock: 1,
    lizard: 1
  }
end

class Sonny < Computer
  def set_name
    @name = 'Sonny'
  end

  MOVE_CHANCES = {
    rock: 0,
    paper: 0,
    scissors: 0,
    spock: 1,
    lizard: 1
  }
end

class Number5 < Computer
  def set_name
    @name = 'Number 5'
  end

  MOVE_CHANCES = {
    rock: 1,
    paper: 1,
    scissors: 1,
    spock: 1,
    lizard: 1
  }
end

module Displayable
  def display_welcome_message
    puts "Hey #{human.name},"
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_rules
    puts "Whoever reaches #{RPSGame::WIN_SCORE} points first wins."
  end

  def display_goodbye_message
    puts "Thank you for playing Rock, Paper, Scissors, Lizard, Spock. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move.to_s}."
    puts "#{computer.name} chose #{computer.move.to_s}."
  end

  def display_score
    puts ""
    puts "#{human.name}: #{human.score}"
    puts "#{computer.name}: #{computer.score}"
    puts ""
  end

  def display_winner
    if human.move > computer.move
      puts ""
      puts "#{human.name} won this round!"
    elsif computer.move > human.move
      puts ""
      puts "#{computer.name} won this round!"
    else
      puts "It's a tie!"
    end
  end

  def display_grand_winner
    winner = human.score > computer.score ? human.name : computer.name

    puts "#{winner} is the Grand Winner!"
  end

  def display_history
    puts ""
    puts "Move history: #{human.name} against #{computer.name}"
    puts ""
    move_history.each do |round, moves|
      puts "Round #{round}: #{moves.first} & #{moves.last}"
    end
    puts ""
  end
end

def display_grand_winner_and_history
  display_grand_winner
  display_history
end

# Game Orcherstration Engine

class RPSGame
  include Displayable

  WIN_SCORE = 3

  attr_accessor :human, :computer, :move_history

  def initialize
    @human = Human.new
    @computer = [R2D2.new, Hal.new, Chappie.new, Sonny.new, Number5.new].sample
    @move_history = {}
    @round = 1
  end

  def play
    clear
    display_welcome_message
    pause
    loop do
      play_round until grand_winner?
      display_grand_winner_and_history
      clear_history_and_score
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  def play_round
    clear
    display_rules
    display_score
    human.choose
    computer.choose
    display_moves
    display_winner
    update_score
    record_history
    pause
  end

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
    elsif computer.move > human.move
      computer.score += 1
    end
  end

  def record_history
    @move_history[@round] = [human.move.to_s, computer.move.to_s]
    @round += 1
  end

  def grand_winner?
    human.score == WIN_SCORE || computer.score == WIN_SCORE
  end

  def clear_score
    human.score = 0
    computer.score = 0
  end

  def clear_history
    self.move_history = {}
    @round = 1
  end

  def clear_history_and_score
    clear_history
    clear_score
  end

  def clear
    system 'clear'
  end

  def pause
    sleep(3)
  end
end

RPSGame.new.play
