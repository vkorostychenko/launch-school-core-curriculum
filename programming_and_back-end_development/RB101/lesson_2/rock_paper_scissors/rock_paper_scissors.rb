VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  Kernel.puts(">> #{message}")
end

def won?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if won?(player, computer)
    prompt('You won!')
  elsif won?(computer, player)
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt('Do you want me to play again?')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

system 'clear'
prompt('Thank you for playing. Good bye!')
