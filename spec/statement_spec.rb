# frozen_string_literal: true

require 'statement'

RSpec.describe Statement do
  subject { described_class }
  let(:transaction_1) { double(:transaction, date: '10/03/2021', type: 'credit', amount: 3000, balance: 3000)}
  let(:transaction_2) { double(:transaction, date: '18/03/2021', type: 'debit', amount: 750, balance: 2250)}
  let(:transaction_history) { [transaction_1, transaction_2] }

  it 'displays the transaction history' do
    expect { subject.print(transaction_history) }
      .to output(/date || credit || debit || balance\n/).to_stdout
  end
end