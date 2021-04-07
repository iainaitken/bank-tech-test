# frozen_string_literal: true

# This class produces a statement of transactions.
class Statement
  def self.print(transaction_history)
    puts 'date || credit || debit || balance'
    transaction_history.reverse.each do |transaction|
      case transaction.type
      when 'credit'
        puts "#{transaction.date} || #{add_decimals(transaction.amount)} || || #{add_decimals(transaction.balance)}"
      when 'debit'
        puts "#{transaction.date} || || #{add_decimals(transaction.amount)} || #{add_decimals(transaction.balance)}"
      end
    end
    nil
  end

  def self.add_decimals(number)
    format('%.2f', number)
  end
end
