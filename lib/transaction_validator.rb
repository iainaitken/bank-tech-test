# frozen_string_literal: true

# This class checks the user input and raises a warning if certain invalid inputs are detected.
class TransactionValidator
  def self.check(_date, type, amount, balance)
    case false
    when check_amount(amount)
      begin 
        raise ValidationError.new('Please enter a valid amount.')
      rescue ValidationError => e
        "#{e.message}"
      end
    when check_transaction_type(type)
      begin 
        raise ValidationError.new('Please enter a valid transaction type.')
      rescue ValidationError => e
        "#{e.message}"
      end
    when check_overdrawn(amount, balance, type)
      begin 
        raise ValidationError.new('You cannot withdraw that much; please try again.')
      rescue ValidationError => e
        "#{e.message}"
      end
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
