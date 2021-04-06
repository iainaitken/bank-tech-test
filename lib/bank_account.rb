# frozen_string_literal: true

class BankAccount
  DEFAULT_BALANCE = 0

  def initialize
    @balance = DEFAULT_BALANCE
  end

  def balance
    format(@balance)
  end

  def deposit_funds(amount)
    return 'Please enter an amount in pence; for example, for £10.50, enter 1050.' unless amount.is_a?(Integer)
    return 'Please enter a valid number.' if amount <= 0

    @balance += amount
    "You have deposited #{format(amount)} into your account. Your balance is now #{format(@balance)}"
  end

  def withdraw_funds(amount)
    return 'Please enter an amount in pence; for example, for £10.50, enter 1050.' unless amount.is_a?(Integer)
    return "You cannot withdraw that much; your account balance is #{format(@balance)}." if amount > @balance

    @balance -= amount
    "You have withdrawn #{format(amount)} from your account."
  end

  private

  def format(number)
    sprintf('£%.2f', number / 100)
  end
end
