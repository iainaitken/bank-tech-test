# frozen_string_literal: true

# This class holds transaction data and allows funds to be added to or withdrawn from the account.
class BankAccount
  attr_reader :transaction_history

  def initialize(
    transaction_class = Transaction,
    statement_class = Statement,
    validator_class = TransactionValidator
  )
    @transaction_history = []
    @transaction_class = transaction_class
    @statement_class = statement_class
    @validator_class = validator_class
  end

  def account_balance
    @transaction_history.empty? ? 0 : @transaction_history.last.balance
  end

  def deposit(amount:)
    add_transaction(:credit, amount)
  end

  def print_statement
    @statement_class.print(@transaction_history)
  end

  def withdraw(amount:)
    add_transaction(:debit, amount)
  end

  private

  def add_transaction(type, amount)
    validation_message = @validator_class.check(type, amount, account_balance)
    if validation_message.nil?
      create_and_store_transaction(type, amount)
    else
      validation_message
    end
  end

  def create_and_store_transaction(type, amount)
    transaction = @transaction_class.new(type, amount, account_balance)
    @transaction_history.push(transaction)
    transaction_message(transaction)
  end

  def transaction_message(transaction)
    case transaction.type
    when :credit
      "You have deposited £#{format('%.2f', transaction.amount)} into your account."
    when :debit
      "You have withdrawn £#{format('%.2f', transaction.amount)} from your account."
    end
  end
end
