# frozen_string_literal: true

class BankAccount
  attr_reader :transaction_history
  
  DEFAULT_BALANCE = 0

  def initialize(transaction_class = Transaction)
    @account_balance = DEFAULT_BALANCE
    @transaction_history = []
    @transaction_class = transaction_class
  end

  def balance
    format(@account_balance)
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

  def format(number)
    '£%.2f' % (number)
  end

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
  



  # def deposit_funds(amount)


  #   @balance += amount
  #   "You have deposited #{format(amount)} into your account. Your balance is now #{format(@balance)}"
  # end

  # def withdraw_funds(amount)


  #   @balance -= amount
  #   "You have withdrawn #{format(amount)} from your account."
  # end
end
