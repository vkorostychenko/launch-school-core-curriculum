module Runable
  def run
    puts "#{self.class} is running..."
  end
end

class Player
  include Runable

  def initialize
    @jersey = 'blue'
  end

  def shoot
    "Shooting..."
  end
end

class Attacker < Player
  def lob
    puts 'Lobbing...'
  end
end

class Midfielder < Player
  def pass
    puts 'Passing...'
  end
end

class Defender < Player
  def block
    puts 'Blocking...'
  end
end

class Goalkeeper < Player
  def initialize
    @jersey = 'white with blue stripes'
  end
end

class Referee
  include Runable

  def initialize
    @jersey = 'black'
  end

  def whistle
    puts 'Whistling...'
  end
end

attacker = Attacker.new
midfielder = Midfielder.new
defender = Defender.new
goalkeeper = Goalkeeper.new
referee = Referee.new

[attacker, midfielder, defender, goalkeeper, referee].each(&:run)
p attacker, midfielder, defender, goalkeeper, referee

attacker.lob
midfielder.pass
defender.block
referee.whistle

=begin
SPORTS TEAM

Include 4 players (attacker, midfielder, defender, goalkeeper)
All the players' jersey is blue, except the goalkeeper, his jersey is white with blue stripes
All players can run and shoot the ball.
Attacker should be able to lob the ball
Midfielder should be able to pass the ball
Defender should be able to block the ball
The referee has a whistle. He wears black and is able to run and whistle.
=end
