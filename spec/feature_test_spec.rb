# frozen_string_literal: true

require 'runfile'

RSpec.describe 'feature test' do
  it 'user can use the program' do
    account = BankAccount.new
    account.add_transaction(date: '01/01/2021', type: 'credit', amount: 2000)
    account.add_transaction(date: '05/01/2021', type: 'debit', amount: 500)
    account.add_transaction(date: '18/01/2021', type: 'debit', amount: 1000)

    expect { account.print_statement }
      .to output(/date || credit || debit || balance\n/).to_stdout
      .and output(/|| || 1000 || 500/).to_stdout
      .and output(/|| || 500 || 1500/).to_stdout
      .and output(/|| 2000 || || 2000/).to_stdout

    expect(account.add_transaction(date: '27/01/2021', type: 'debit', amount: 1000))
      .to eq('You cannot withdraw that much; please try again.')
  end
end
