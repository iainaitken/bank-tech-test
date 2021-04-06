class BankAccount
  attr_reader :balance
  DEFAULT_BALANCE = 0
  
  def initialize
    @balance = DEFAULT_BALANCE
  end
end