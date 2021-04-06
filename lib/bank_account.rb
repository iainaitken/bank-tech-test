# frozen_string_literal: true

class BankAccount
  attr_reader :balance

  DEFAULT_BALANCE = 0.00

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def deposit_funds(amount)
    return 'Please enter a valid number.' if amount <= 0

    @balance += amount
    "You have deposited £#{amount} into your account. Your balance is now #{@balance}"
  end

  # to do - guard against too many decimal places. Extract to a separate error class, or to a private method

  def withdraw_funds(amount)
    return "You cannot withdraw that much; your account balance is #{@balance}." if amount > @balance

    @balance -= amount
    "You have withdrawn £#{amount} from your account."
  end
end
