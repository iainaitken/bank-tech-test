# frozen_string_literal: true

# This class holds the data for an individual transaction.
class Transaction
  attr_reader :date, :type, :amount, :balance

  def initialize(date, type, amount, starting_balance)
    @date = date
    @type = type
    @amount = amount
    @balance = adjust_balance(starting_balance)
  end

  private

  def adjust_balance(starting_balance)
    case @type
    when 'credit'
      starting_balance += @amount
    when 'debit'
      starting_balance -= @amount
    end
  end
end
