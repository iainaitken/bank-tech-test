class Transaction
  attr_reader :date, :type, :amount
  
  def initialize(date:, type:, amount:)
    @date = date
    @type = type.to_sym
    @amount = amount.to_i
  end
end