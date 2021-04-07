# frozen_string_literal: true

class BankAccount
  attr_reader :transaction_history
  
  DEFAULT_BALANCE = 0

  def initialize(transaction_class = Transaction)
    @balance = DEFAULT_BALANCE
    @transaction_history = []
    @transaction_class = transaction_class
  end

  def balance
    format(@balance)
  end

  def add_transaction(date, type, amount)
    validation_message = TransactionValidator.check(date, type, amount, balance)
    if validation_message == 'OK'
      create_and_store_transaction(date, type, amount)
    else
      validation_message
    end
  end

  private

  def format(number)
    '£%.2f' % (number / 100)
  end

  def create_and_store_transaction(date, type, amount)
    transaction = @transaction_class.new(
      date: date,
      type: type,
      amount: amount,
      starting_balance: @balance
    )
    @transaction_history.push(transaction)
  end
    # def deposit_funds(amount)
  #   return 'Please enter an amount in pence; for example, for £10.50, enter 1050.' unless amount.is_a?(Integer)
  #   return 'Please enter a valid number.' if amount <= 0

  #   @balance += amount
  #   "You have deposited #{format(amount)} into your account. Your balance is now #{format(@balance)}"
  # end

  # def withdraw_funds(amount)
  #   return 'Please enter an amount in pence; for example, for £10.50, enter 1050.' unless amount.is_a?(Integer)
  #   return "You cannot withdraw that much; your account balance is #{format(@balance)}." if amount > @balance

  #   @balance -= amount
  #   "You have withdrawn #{format(amount)} from your account."
  # end
end
