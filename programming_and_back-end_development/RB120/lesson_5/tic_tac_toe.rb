module Promptable
  def continue
    puts "Press any key to continue..."
    gets
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %(y n).include?(answer)
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end
end

module Displayable
  include Promptable

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts "First to #{TTTGame::WIN_SCORE} wins the game. Good luck!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    puts "You're #{human.marker}. Computer is a #{computer.marker}."
    puts ""
    display_score
    puts ""
    board.draw
    puts ""
  end

  def display_score
    puts "Score #{human.score} | #{computer.score}"
  end

  def display_winner
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won this round!"
    when computer.marker
      puts "Computer won this round!"
    else
      puts "It's a tie!"
    end
    puts ""
  end

  def display_choose_a_square_message
    free_squares = board.unmarked_keys

    list = if free_squares.size > 1
             free_squares[0...-1].join(', ') + " or #{free_squares.last}"
           else
             free_squares.join
           end

    puts "Choose a square (#{list}): "
  end

  def display_grand_winner
    if human.score == TTTGame::WIN_SCORE
      puts "You are the grand winner!"
    else
      puts "Computer is the grand winner!"
    end
    puts ""
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def clear
    system 'clear'
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
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
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
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
  attr_accessor :score
  attr_reader :marker

  def initialize(marker)
    @marker = marker
    @score = 0
  end

  def reset_score
    self.score = 0
  end
end

class TTTGame
  include Displayable

  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER
  WIN_SCORE = 2

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      loop do
        play_round
        display_winner
        continue
        grand_winner? ? break : clear_screen_and_reset_round
      end
      clear_screen_and_display_grand_winner
      play_again? ? clear_screen_and_reset_game : break
    end
  end

  def play_round
    display_board
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
    update_score
  end

  def human_moves
    display_choose_a_square_message
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def update_score
    case board.winning_marker
    when human.marker    then human.score += 1
    when computer.marker then computer.score += 1
    end
  end

  def grand_winner?
    human.score == WIN_SCORE || computer.score == WIN_SCORE
  end

  def reset_round
    board.reset
    @current_marker = FIRST_TO_MOVE
  end

  def reset_game
    reset_round
    human.reset_score
    computer.reset_score
  end

  def clear_screen_and_reset_round
    clear
    reset_round
  end

  def clear_screen_and_reset_game
    clear
    reset_game
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def clear_screen_and_display_grand_winner
    clear
    display_grand_winner
  end
end

game = TTTGame.new
game.play
