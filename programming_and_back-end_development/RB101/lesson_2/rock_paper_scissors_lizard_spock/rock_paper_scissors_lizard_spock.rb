require 'yaml'
MESSAGES = YAML.load_file('messages.yml')

MOVES = {
  'rock' => { shorthand: 'r', beats: ['lizard', 'scissors'] },
  'paper' => { shorthand: 'p', beats: ['rock', 'spock'] },
  'scissors' => { shorthand: 'sc', beats: ['paper', 'lizard'] },
  'lizard' => { shorthand: 'l', beats: ['spock', 'paper'] },
  'spock' => { shorthand: 'sp', beats: ['scissors', 'rock'] }
}

WIN_SCORE = 3

def prompt(message)
  Kernel.puts(">> #{message}")
end

def available_choices
  choices = String.new
  MOVES.each do |move, data|
    choices << "#{move} (#{data[:shorthand]}), "
  end
  choices.chomp(', ')
end

def print_available_choices
  prompt("Choose one: #{available_choices}")
  prompt(MESSAGES['press_enter'])
end

def valid_choice?(choice)
  valid_choices = Hash.new
  MOVES.each do |move, data|
    valid_choices[move] = data[:shorthand]
  end
  valid_choices.key?(choice) || valid_choices.value?(choice)
end

def convert_choice!(player_choice)
  MOVES.each do |move, data|
    player_choice.gsub!(player_choice, move) if data.key(player_choice)
  end
end

def get_player_choice
  choice = ''

  loop do
    print_available_choices()
    choice = Kernel.gets().chomp().downcase()

    if valid_choice?(choice)
      convert_choice!(choice) if choice.length <= 2

      break
    else
      prompt(MESSAGES['invalid_choice'])
    end
  end

  choice
end

def display_choices(player_choice, computer_choice)
  prompt("You chose: #{player_choice.upcase} " \
          "| Computer chose: #{computer_choice.upcase}")

  sleep(1)
end

def win?(first, second)
  MOVES[first][:beats].include?(second)
end

def display_results(player, computer)
  if player == computer
    prompt(MESSAGES['tie'])
  elsif win?(player, computer)
    prompt(MESSAGES['player_won'])
  else
    prompt(MESSAGES['computer_won'])
  end

  sleep(3)
end

def display_winner(player_score, computer_score)
  prompt(MESSAGES['player_winner']) if player_score == WIN_SCORE
  prompt(MESSAGES['computer_winner']) if computer_score == WIN_SCORE

  sleep(1)
end

def reset_score!(score)
  score.transform_values! { |value| value * 0 }
end

def update_score(score, player, computer)
  score[:player] += 1 if win?(player, computer)
  score[:computer] += 1 if win?(computer, player)
end

def print_score(score)
  system 'clear'

  prompt("Your score: #{score[:player]} | Computer score: #{score[:computer]}")

  puts("\n")
end

system 'clear'

prompt(MESSAGES['welcome'])
prompt(MESSAGES['rules'])
puts("\n")

score = { player: 0, computer: 0 }

loop do
  loop do
    player_move = get_player_choice()
    computer_move = MOVES.keys().sample()

    display_choices(player_move, computer_move)

    display_results(player_move, computer_move)
    update_score(score, player_move, computer_move)
    print_score(score)

    break if score.value?(WIN_SCORE)
  end

  display_winner(score[:player], score[:computer])
  reset_score!(score)

  prompt(MESSAGES['play_again'])

  if gets().chomp().downcase().start_with?('y')
    system 'clear'

  else
    break
  end
end

system 'clear'
prompt(MESSAGES['goodbye'])
