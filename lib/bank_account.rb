# frozen_string_literal: true

# This class holds transaction data and allows funds to be added to or withdrawn from the account.
class BankAccount
  attr_reader :account_balance, :transaction_history

  DEFAULT_BALANCE = 0

  def initialize(transaction_class = Transaction)
    @account_balance = DEFAULT_BALANCE
    @transaction_history = []
    @transaction_class = transaction_class
  end

  def add_transaction(date, type, amount)
    validation_message = TransactionValidator.check(date, type, amount, @account_balance)
    if validation_message == 'OK'
      create_and_store_transaction(date, type, amount)
      update_balance(amount, type)
    else
      validation_message
    end
  end

  private

  def create_and_store_transaction(date, type, amount)
    transaction = @transaction_class.new(
      date: date,
      type: type,
      amount: amount,
      starting_balance: @account_balance
    )
    @transaction_history.push(transaction)
  end

  def update_balance(amount, type)
    case type
    when 'credit'
      @account_balance += amount
    when 'debit'
      @account_balance -= amount
    end
  end
end
