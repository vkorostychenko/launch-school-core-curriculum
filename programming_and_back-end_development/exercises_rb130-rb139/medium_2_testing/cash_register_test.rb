require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  attr_accessor :register, :transaction

  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(45)
    transaction.amount_paid = 50
  end
  
  def test_accept_money
    previous_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money
    assert_equal previous_amount + transaction.amount_paid, current_amount
  end

  def test_change
    expected_change = transaction.amount_paid - transaction.item_cost
    assert_equal expected_change, register.change(transaction)
  end

  def test_give_receipt
    # expected = <<~OUTPUT.chomp
    #   You've paid $#{transaction.item_cost}.

    # OUTPUT
    expected = "You've paid $#{transaction.item_cost}.\n"

    assert_output(expected) { register.give_receipt(transaction) }
  end

  def test_promt_for_payment
    input = StringIO.new("100\n")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 100, transaction.amount_paid
  end
end
