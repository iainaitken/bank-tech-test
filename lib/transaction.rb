class Transaction
  attr_reader :date, :credit, :debit, :balance
  
  def initialize(date:, credit:, debit:, balance:)
    @date = date
    @credit = credit.to_i unless credit == ""
    @debit = debit.to_i unless debit == ""
    @balance = balance.to_i
  end
end