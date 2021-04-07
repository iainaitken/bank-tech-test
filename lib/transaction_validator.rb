class TransactionValidator
  def self.check(date:, type:, amount:)
    case false
    when check_amount(amount)
      'Please enter a valid amount.'
    when check_transaction_type(type)
      'Please enter a valid transaction type.'
    end
  end

  private

  def self.check_amount(amount)
    false unless amount.is_a?(Integer) && amount > 0
  end

  def self.check_transaction_type(type)
    type == 'credit' || type == 'debit'
  end
end