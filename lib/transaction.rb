# frozen_string_literal: true

class Transaction
  attr_reader :date, :type, :amount, :balance

  def initialize(date:, type:, amount:, starting_balance:)
    @date = date
    @type = type
    @amount = amount
    @balance = starting_balance
    adjust_balance
  end

  private

  def adjust_balance
    case @type
    when 'credit'
      @balance += @amount
    when 'debit'
      @balance -= @amount
    end
  end
end
