class TransactionValidator
  def self.check(date:, type:, amount:)
    return 'Please enter a valid number.' unless amount > 0
    return 'Please enter a valid transaction type.' unless type == 'credit' || type == 'debit'
  end
end