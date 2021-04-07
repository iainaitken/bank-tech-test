# frozen_string_literal: true

# This class checks the user input and raises a warning if certain invalid inputs are detected.
class TransactionValidator
  def self.check(_date, type, amount, balance)
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

  def self.check_amount(amount)
    false unless amount.is_a?(Integer) && amount.positive?
  end

  def self.check_transaction_type(type)
    %w[credit debit].include?(type)
  end

  def self.check_overdrawn(amount, balance, type)
    false if type == ('debit') && (amount > balance)
  end
end
