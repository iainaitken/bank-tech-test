class TransactionValidator
  def self.check(date, type, amount, balance)
    case false
    when check_amount(amount)
      'Please enter a valid amount.'
    when check_transaction_type(type)
      'Please enter a valid transaction type.'
    when check_overdrawn(amount, balance, type)
      'You cannot withdraw that much; please try again.'
    else
      'OK'
    end
  end

  private

  def self.check_amount(amount)
    false unless amount.is_a?(Integer) && amount > 0
  end

  def self.check_transaction_type(type)
    type == 'credit' || type == 'debit'
  end

  def self.check_overdrawn(amount, balance, type)
    if type == 'debit'
      false if amount > balance
    end
  end
end