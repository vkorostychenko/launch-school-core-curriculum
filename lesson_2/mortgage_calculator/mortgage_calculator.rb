require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def prompt(message)
  Kernel.puts(">> #{message}")
end

def integer?(input)
  input.to_i().to_s() == input
end

def float?(input)
  input.to_f().to_s() == input
end

def number?(input)
  integer?(input) || float?(input)
end

prompt(MESSAGES['welcome'])
prompt(MESSAGES['divider'])

loop do
  loan_ammount = ''
  loop do
    prompt(MESSAGES['loan_ammount'])
    loan_ammount = Kernel.gets().chomp()

    if number?(loan_ammount)
      loan_ammount = loan_ammount.to_i()
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  annual_percentage_rate = ''
  loop do
    prompt(MESSAGES['annual_percentage_rate'])
    annual_percentage_rate = Kernel.gets().chomp()

    if number?(annual_percentage_rate)
      annual_percentage_rate = annual_percentage_rate.to_f() / 100
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  loan_duration = ''
  loop do
    prompt(MESSAGES['loan_duration'])
    loan_duration = Kernel.gets().chomp()

    if number?(loan_duration)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  loan_duration_months = loan_duration.to_i() * 12
  monthly_interest_rate = annual_percentage_rate / 12

  monthly_payment = loan_ammount *
                    (monthly_interest_rate /
                    (1 - (1 + monthly_interest_rate)**(-loan_duration_months)))

  prompt(MESSAGES['divider'])
  prompt("Monthly payment is $#{monthly_payment.round(2)}")
  prompt(MESSAGES['divider'])

  prompt(MESSAGES['another'])
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['thank'])
prompt(MESSAGES['goodbye'])
