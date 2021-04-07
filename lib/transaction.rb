class Transaction
  attr_reader :date, :type, :amount, :balance
  
  def initialize(date:, type:, amount:, starting_balance:)
    @date = date
    @type = type.to_sym
    @amount = amount.to_i
    @balance = starting_balance.to_i
    adjust_balance
  end

  private

  def adjust_balance
    if @type == :credit
      return @balance += @amount
    elsif @type == :debit
      return @balance -= @amount
    end
  end
end