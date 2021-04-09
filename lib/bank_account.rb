# frozen_string_literal: true

# This class holds transaction data and allows funds to be added to or withdrawn from the account.
class BankAccount
  attr_reader :transaction_history

  def initialize(transaction_class = Transaction, statement_class = Statement)
    @transaction_history = []
    @transaction_class = transaction_class
    @statement_class = statement_class
  end

  def account_balance
    @transaction_history != [] ? @transaction_history.last.balance : 0
  end

  def add_transaction(date:, type:, amount:)
    validation_message = TransactionValidator.check(date, type, amount, account_balance)
    if validation_message == nil
      create_and_store_transaction(date, type, amount)
    else
      validation_message
    end
  end

  def print_statement
    @statement_class.print(@transaction_history)
  end

  private

  def create_and_store_transaction(date, type, amount)
    transaction = @transaction_class.new(date, type, amount, account_balance)
    @transaction_history.push(transaction)
  end
end
