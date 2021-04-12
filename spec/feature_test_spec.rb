# frozen_string_literal: true

require 'runfile'

RSpec.describe 'feature test' do
  before do
    time1 = Time.new(2021, 2, 14)
    time2 = Time.new(2021, 2, 21)
    time3 = Time.new(2021, 2, 28)
    allow(Time).to receive(:now).and_return(time1, time2, time3)
  end

  it 'user can use the program' do
    account = BankAccount.new
    account.deposit(amount: 1000)
    account.deposit(amount: 2000)
    account.withdraw(amount: 500)

    expect { account.print_statement }
      .to output(/date || credit || debit || balance\n/).to_stdout
      .and output(/28-02-2021 || || 500.00 || 2500.00/).to_stdout
      .and output(/21-02-2021 || 2000.00 || || 3000.00/).to_stdout
      .and output(/14-02-2021 || 1000.00 || || 1000.00/).to_stdout

    expect(account.withdraw(amount: 3000))
      .to eq('You cannot withdraw that much; please try again.')
  end
end
