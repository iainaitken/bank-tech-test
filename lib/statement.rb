class Statement
  def self.print(transaction_history)
    puts 'date || credit || debit || balance'
    # ledger = ''
    transaction_history.reverse.each do |transaction|
      if transaction.type == 'credit'
        puts "#{transaction.date} || #{add_decimals(transaction.amount)} || || #{add_decimals(transaction.balance)}"
      elsif transaction.type == 'debit'
        puts "#{transaction.date} || || #{add_decimals(transaction.amount)} || #{add_decimals(transaction.balance)}"
      end
    end
    return nil
  end

  private

  def self.add_decimals(number)
    '%.2f' % number.to_s
  end
end