require 'pry'
require 'pry-byebug'

module Promptable
  private

  def prompt(msg)
    puts "=> #{msg}"
  end
end

module Displayable
  private

  def display_turn(name)
    prompt "#{name}'s turn..."
    puts ''
  end

  def display_stay(name)
    prompt "#{name} stays!"
    puts ''
  end

  def display_hit(name)
    prompt "#{name} hits!"
    puts ''
  end

  def display_busted(name)
    prompt "#{name} busted!"
    puts ''
  end

  def display_winner(winner)
    prompt "#{winner} wins!"
    puts ''
  end

  def display_tie
    prompt "It's a tie!"
  end

  def display_welcome_message
    prompt "Hey #{player.name}! Welcome to Twenty-One!"
    puts ''
    prompt "The goal of this game is to try to get as close to 21 as " \
           "possible, without going over."
    prompt "If you go over 21, it's a 'bust' and you lose."
    puts ''
  end

  def display_goodbye_message
    prompt 'Thanks for playing Twenty-One! Goodbye!'
    puts ''
  end

  def clear
    system 'clear'
  end
end

class Card
  SUITS = %w(C D H S)
  FACES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  ROYALTY_VALUE = 10
  ACE_VALUE = 11 # 1 if total exceeds BEST_TOTAL

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def face
    case @face
    when 'J' then 'Jack'
    when 'Q' then 'Queen'
    when 'K' then 'King'
    when 'A' then 'Ace'
    else
      @face
    end
  end

  def suit
    case @suit
    when 'H' then 'Hearts'
    when 'D' then 'Diamonds'
    when 'S' then 'Spades'
    when 'C' then 'Clubs'
    end
  end

  def to_s
    "The #{face} of #{suit}"
  end

  def to_i
    if ace?
      ACE_VALUE
    elsif jack? || queen? || king?
      ROYALTY_VALUE
    else
      face.to_i
    end
  end

  def ace?
    face == 'Ace'
  end

  def king?
    face == 'King'
  end

  def queen?
    face == 'Queen'
  end

  def jack?
    face == 'Jack'
  end
end

class Deck
  def initialize
    @cards = []

    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end

    scramble!
  end

  def scramble!
    @cards.shuffle!
  end

  def deal_one
    @cards.pop
  end
end

module Hand
  def show_hand
    puts "---- #{name}'s Hand ----"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
    puts ''
  end

  def <<(card)
    @cards << card
  end

  def total
    total = cards.map(&:to_i).sum

    # correct for Aces
    cards.count(&:ace?).times { total -= 10 if total > TwentyOne::BEST_TOTAL }

    total
  end

  def busted?
    total > TwentyOne::BEST_TOTAL
  end
end

class Participant
  include Hand

  attr_accessor :name, :cards

  def initialize
    @cards = []
    set_name
  end

  def reset
    @cards = []
  end
end

class Player < Participant
  include Promptable

  def set_name
    name = ''
    loop do
      prompt 'What is your name?'
      name = gets.chomp.strip.capitalize
      break unless name.empty?

      prompt 'Sorry, must enter a value.'
    end

    self.name = name
  end

  def show_flop
    show_hand
  end
end

class Dealer < Participant
  MIN_TOTAL = 17
  ROBOTS = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5']

  def set_name
    self.name = ROBOTS.sample
  end

  def show_flop
    puts "---- #{name}'s Hand ----"
    puts "=> #{cards.first}"
    puts '=> ??'
    puts ''
  end
end

class TwentyOne
  include Promptable
  include Displayable

  BEST_TOTAL = 21

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @participants = [player, dealer]
    @deck = Deck.new
  end

  def play
    clear
    display_welcome_message
    deal_cards
    show_flop
    player_turn
    dealer_turn

    # both stayed
    show_cards
    show_result
    display_goodbye_message
  end

  private

  attr_reader :deck, :player, :dealer, :participants

  def deal_cards
    participants.each do |participant|
      2.times { participant << deck.deal_one }
    end
  end

  def show_flop
    participants.each(&:show_flop)
  end

  def hit_or_stay
    prompt 'Would you like to (h)it or (s)tay?'
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if %w(h s).include? answer
      prompt "Sorry, must enter 'h' or 's'."
    end

    answer
  end

  def player_turn
    display_turn(player.name)

    loop do
      if hit_or_stay == 's'
        display_stay(player.name)
        break
      elsif player.busted?
        break
      else
        player << deck.deal_one
        display_hit(player.name)
        player.show_hand
        break if player.busted?
      end
    end
  end

  def dealer_turn
    display_turn(dealer.name)

    loop do
      if dealer.total >= Dealer::MIN_TOTAL && !dealer.busted?
        display_stay(dealer.name)
        break
      elsif dealer.busted?
        break
      else
        display_hit(dealer.name)
        dealer << deck.deal_one
      end
    end
  end

  def show_busted
    if player.busted?
      display_busted(player.name)
    elsif dealer.busted?
      display_busted(dealer.name)
    end
  end

  def show_result
    if player.total > dealer.total
      display_winner(player.name)
    elsif player.total < dealer.total
      display_winner(dealer.name)
    else
      display_tie
    end
  end

  def show_cards
    participants.each(&:show_hand)
  end

  def play_again?
    answer = nil
    loop do
      prompt 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if %w(y n).include? answer

      prompt 'Sorry, must be y or n.'
    end

    answer == 'y'
  end

  def reset
    self.deck = Deck.new

    participants.each(&:reset)
  end
end

game = TwentyOne.new
game.play
