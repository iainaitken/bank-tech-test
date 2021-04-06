class BankAccount
  attr_reader :balance
  DEFAULT_BALANCE = 0
  
  def initialize
    @balance = DEFAULT_BALANCE
  end

  def deposit_funds(amount)
    "You have deposited £#{amount} into your account."
  end
end