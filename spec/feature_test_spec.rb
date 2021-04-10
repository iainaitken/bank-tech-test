# frozen_string_literal: true

require 'runfile'

RSpec.describe 'feature test' do
  it 'user can use the program' do
    account = BankAccount.new
    account.add_transaction(date: '10/01/2012', type: 'credit', amount: 1000)
    account.add_transaction(date: '13/01/2012', type: 'credit', amount: 2000)
    account.add_transaction(date: '14/01/2012', type: 'debit', amount: 500)

    expect { account.print_statement }
      .to output(/date || credit || debit || balance\n/).to_stdout
      .and output(/|| || 500.00 || 2500.00/).to_stdout
      .and output(/|| 2000.00 || || 3000.00/).to_stdout
      .and output(/|| 1000.00 || || 1000.00/).to_stdout

    expect(account.add_transaction(date: '27/01/2012', type: 'debit', amount: 3000))
      .to eq('You cannot withdraw that much; please try again.')
  end
end
