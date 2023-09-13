WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9], # colons
  [1, 5, 9], [3, 5, 7]             # diagonals
].freeze
INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
WIN_SCORE = 5

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop: disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, score)
  system 'clear'
  display_score(score)
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ''
  puts '     |     |'
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts '     |     |'
  puts '-----+-----+-----'
  puts '     |     |'
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts '     |     |'
  puts ''
end
# rubocop: enable Metrics/MethodLength, Metrics/AbcSize

def display_score(score)
  puts "Score: Player #{score['Player']} | Computer #{score['Computer']}"
  puts ''
end

def display_round_winner(brd)
  system 'clear'
  prompt "#{detect_winner(brd)} won this round!"
  sleep(3)
end

def display_winner(score, brd)
  system 'clear'
  display_score(score)
  prompt "Game over! #{detect_winner(brd)} won!"
  sleep(3)
end

def display_tie
  system 'clear'
  prompt "It's a tie!"
  sleep(3)
end

def initialise_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delim = ', ', conj = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first.to_s
  when 2 then arr.join(" #{conj} ")
  else arr[0..-2].join(delim) + "#{delim + conj} #{arr.last}"
  end
end

def player_places_piece!(brd)
  square = nil

  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)

    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if line.all? { |i| brd[i] == PLAYER_MARKER }
      return 'Player'
    elsif line.all? { |i| brd[i] == COMPUTER_MARKER }
      return 'Computer'
    end
  end

  nil
end

def update_score(score, name)
  score[name] += 1
end

loop do
  score = { 'Player' => 0, 'Computer' => 0 }

  # play round
  loop do
    board = initialise_board
    display_board(board, score)

    # play move
    loop do
      display_board(board, score)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, score)

    if someone_won?(board)
      display_round_winner(board)
      update_score(score, detect_winner(board))
    else
      display_tie
    end

    if score.values.include?(WIN_SCORE)
      display_winner(score, board)
      break
    end
  end

  prompt 'Play again? (y or n)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thanks for playing Tic Tac Toe! Good bye!'
