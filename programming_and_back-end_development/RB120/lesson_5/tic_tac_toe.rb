module Promptable
  def prompt(message)
    puts "=> #{message}"
  end

  def enter_username
    name = ""
    loop do
      prompt "What is your name?"
      name = gets.chomp.strip.capitalize
      break unless name.empty?

      prompt "Sorry, must enter a value."
    end

    name
  end

  def choose_marker
    choice = ""
    loop do
      prompt "Start the game as 'X' or choose 'O' so the opponent goes first."
      choice = gets.chomp.upcase
      break if %w(X O).include? choice

      prompt "Sorry, must be 'X' or 'O'."
    end

    choice
  end

  def choose_square(list)
    choice = nil
    loop do
      prompt "Choose a square (#{joinor(list)}): "
      choice = gets.chomp.to_i
      break if list.include? choice

      prompt "Sorry, must be a value from the list."
    end

    choice
  end

  def continue
    prompt "Press any key to continue..."
    gets
  end

  def play_again?
    answer = nil
    loop do
      prompt "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer

      prompt "Sorry, must be y or n."
    end

    answer == 'y'
  end

  private

  def joinor(arr)
    if arr.size > 1
      arr[0...-1].join(', ') + " or #{arr.last}"
    else
      arr.join
    end
  end
end

module Displayable
  include Promptable

  def display_welcome_message
    prompt "Welcome to Tic Tac Toe!"
    prompt "First to #{self.class::WIN_SCORE} is the Grand Winner. Good luck!"
  end

  def display_goodbye_message
    prompt "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    display_score
    board.draw
    prompt "You're '#{human.marker}'. #{computer.name} is '#{computer.marker}'"
  end

  def display_score
    h = "#{human.name}: #{human.score}"
    c = "#{computer.name}: #{computer.score}"

    prompt "#{h} | #{c}"
  end

  def display_result
    clear_screen_and_display_board # captures the final move
    if winning_player
      prompt "#{winning_player} wins!"
      winning_player.increment_score
    else
      prompt "It's a tie!"
    end
  end

  def display_grand_winner
    clear
    display_score
    prompt "#{grand_winner} is the Grand Winner!"
  end

  def display_play_again_message
    prompt "Let's play again!"
  end

  def clear
    system 'clear'
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  MIDDLE_SQUARE = 5

  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def middle_square_unmarked?
    @squares[MIDDLE_SQUARE].unmarked?
  end

  def unmarked_squares
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def square_at_risk(marker)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line).collect(&:marker)
      if squares.count(marker) == 2 &&
         squares.count(Square::INITIAL_MARKER) == 1
        return line[squares.index(Square::INITIAL_MARKER)]
      end
    end

    nil
  end

  def random_square
    unmarked_squares.sample
  end

  def full?
    unmarked_squares.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end

    nil
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts ""
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |       1 | 2 | 3 "
    puts "-----+-----+----- ---+---+---"
    puts "     |     |       4 | 5 | 6 "
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}   ---+---+---"
    puts "     |     |       7 | 8 | 9 "
    puts ""
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :name, :marker
  attr_reader :score

  def initialize
    @score = 0
  end

  def increment_score
    @score += 1
  end

  def reset_score
    @score = 0
  end

  def to_s
    name
  end
end

class Human < Player
  include Promptable

  def move(board)
    board[choose_square(board.unmarked_squares)] = marker
  end
end

class Computer < Player
  def move(board)
    square =
      board.square_at_risk(TTTGame.computer_marker) || # winnning move
      board.square_at_risk(TTTGame.human_marker) || # defence
      (Board::MIDDLE_SQUARE if board.middle_square_unmarked?) ||
      board.random_square

    board[square] = marker
  end
end

class TTTGame
  include Displayable

  WIN_SCORE = 5
  COMPUTER_NAMES = %w(R2D2 Hal Chappie Sonny Number5)

  @@human_marker = 'X'
  @@computer_marker = 'O'

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
    @current_turn = human
  end

  def self.human_marker
    @@human_marker
  end

  def self.computer_marker
    @@computer_marker
  end

  def play
    clear
    display_welcome_message
    setup
    main_game
    display_goodbye_message
  end

  private

  def play_turns
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board
    end
  end

  def main_game
    loop do
      display_board
      play_turns
      display_result_and_prompt_continue
      if grand_winner
        display_grand_winner
        play_again? ? display_play_again_message_and_reset_score : break
      end
      reset
    end
  end

  def setup
    set_markers
    set_names
    clear
  end

  def set_names
    human.name = enter_username
    computer.name = COMPUTER_NAMES.sample
  end

  def set_markers
    if choose_marker == 'O'
      @@human_marker = 'O'
      @@computer_marker = 'X'
    end

    human.marker = @@human_marker
    computer.marker = @@computer_marker
    @current_turn = who_is_x
  end

  def human_turn?
    @current_turn == human
  end

  def who_is_x
    human.marker == 'X' ? human : computer
  end

  def alternate_turn
    @current_turn = (human_turn? ? computer : human)
  end

  def current_player_moves
    human_turn? ? human.move(board) : computer.move(board)
    alternate_turn
  end

  def winning_player
    case board.winning_marker
    when human.marker    then human
    when computer.marker then computer
    end
  end

  # returns a player object or nil
  def grand_winner
    [human, computer].select { |player| player.score == WIN_SCORE }.first
  end

  def display_result_and_prompt_continue
    display_result
    continue
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_play_again_message_and_reset_score
    display_play_again_message
    [human, computer].each(&:reset_score)
  end

  def reset
    board.reset
    @current_turn = who_is_x
    clear
  end
end

game = TTTGame.new
game.play
