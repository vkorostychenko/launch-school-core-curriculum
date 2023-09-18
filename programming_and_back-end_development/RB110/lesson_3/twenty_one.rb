SUITS = ['S', 'D', 'C', 'S']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
WIN_SCORE = 21
DEALER_MIN_TOTAL = 17

def prompt(msg)
  puts "=>#{msg}"
end

def initialise_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map(&:last)

  sum = 0
  values.each do |value|
    if value == 'A'
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > WIN_SCORE
  end

  sum
end

def busted?(total)
  total > WIN_SCORE
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_total, player_total)
  if player_total > WIN_SCORE
    :player_busted
  elsif dealer_total > WIN_SCORE
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_total, player_total)
  result = detect_result(dealer_total, player_total)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

loop do
  prompt 'Welcome to Twenty-One!'

  # initialise vars
  deck = initialise_deck
  player_cards = []
  dealer_cards = []

  # inial deal
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end

  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  prompt "Dealer has #{dealer_cards.first} and ?"
  prompt "You have: #{player_cards.first} and #{player_cards.last}, " \
         "for a total of #{player_total}."

  # player turn
  loop do
    player_turn = nil

    loop do
      prompt 'Would you like to (h)it of (s)tay?'
      player_turn = gets.chomp.downcase
      break if ['h', 's'].include?(player_turn)

      prompt "Sorry, must enter 'h' or 's'."
    end

    if player_turn == 'h'
      player_cards << deck.pop
      player_total = total(player_cards)
      prompt 'You choose to hit!'
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{player_total}"
    end

    break if player_turn == 's' || busted?(player_total)
  end

  if busted?(player_total)
    display_result(dealer_total, player_total)
    play_again? ? next : break
  else
    prompt "You stayed at: #{player_total}"
  end

  # dealer turn
  prompt 'Dealer turn...'

  loop do
    break if dealer_total >= DEALER_MIN_TOTAL

    prompt 'Dealer hits!'
    dealer_cards << deck.pop
    dealer_total = total(dealer_cards)
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  if busted?(dealer_total)
    prompt "Dealer's total is now: #{dealer_total}"
    display_result(dealer_total, player_total)
    play_again? ? next : break
  else
    prompt "Dealer stays at: #{dealer_total}"
  end

  # both player and dealer stay - compare cards!
  puts '=============='
  prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total}"
  prompt "Player has #{player_cards}, for a total of: #{player_total}"
  puts '=============='

  display_result(dealer_total, player_total)

  break unless play_again?
end

prompt 'Thank you for playing Twenty-One! Good bye!'
