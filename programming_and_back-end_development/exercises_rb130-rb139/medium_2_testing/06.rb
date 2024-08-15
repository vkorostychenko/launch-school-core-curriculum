# Test Prompt For Payment Method- Transaction

# Write a test that verifies that Transaction#prompt_for_payment sets the
# amount_paid correctly. We've changed the transaction class a bit to make
# testing this a bit easier. The Transaction#prompt_for_payment now reads as:

# def prompt_for_payment(input: $stdin)
#   loop do
#     puts "You owe $#{item_cost}.\nHow much are you paying?"
#     @amount_paid = input.gets.chomp.to_f # notice that we call gets on that parameter
#     break if valid_payment? && sufficient_payment?
#     puts 'That is not the correct amount. ' \
#          'Please make sure to pay the full cost.'
#   end
# end

# We've added an input keyword parameter that lets the caller provide a different
# source of input. The default value for the parameter is $stdin; if we don't
# provide the input parameter, Ruby will use $stdin as its value.

# In this exercise, we'll need to simulate -- mock -- the user input. Our tests
# need to be automated, so we can't prompt the user with Kernel#gets. One way to
# do that is to pass a "string stream" to the method as the input parameter.
# Ruby provides a string stream class called StringIO. To use it, all you need to
# do is create a StringIO object that contains all of your simulated keyboard
# inputs, then pass it to prompt_for_payment. For instance:

# input = StringIO.new("30\n")
# transaction.prompt_for_payment(input: input)

# The object assigned to input here is a StringIO object that simulates the
# keyboard by acting like the user typed the number 30, then pressed the
# Return key (\n). Check out how this works with gets:

# input = StringIO.new("30\n")
# number = input.gets.chomp
# puts "The number was #{number}!"   # prints "The number was 30!"

# With this technique, running tests for keyboard entry is a breeze.
# Just sit back and watch things run. Writing the tests is a little harder.
# Once you understand how a StringIO object works, though, and you modify your
# code for the additional flexibility, it's not too hard.

# The key to solving this exercise lies with this technique. We'll be testing a
# method defined in the Transaction class. It may be best to include this test in
# a new test file related to the Transaction class.
