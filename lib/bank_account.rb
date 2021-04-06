class BankAccount
  attr_reader :balance
  DEFAULT_BALANCE = 0.00
  
  def initialize
    @balance = DEFAULT_BALANCE
  end

  def deposit_funds(amount)
    return "Please enter a valid number." if amount <= 0

    @balance += amount
    "You have deposited £#{amount} into your account."
  end
end