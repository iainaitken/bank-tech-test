# frozen_string_literal: true

require 'bank_account'

RSpec.describe BankAccount do
  subject { described_class.new }

  it 'knows the balance of the account' do
    expect(subject.account_balance).to eq(0)
  end

  it 'starts with an empty transaction history' do
    expect(subject.transaction_history).to eq([])
  end

  describe '#add_transaction' do
    let(:transaction) { instance_double(Transaction, date: '06/04/2021', type: :credit, amount: 500, balance: 1000) }

    context 'transaction passes validation checks' do
      it 'adds a transaction to the stored list' do
        transaction_class = class_double('Transaction', new: transaction).as_stubbed_const
        subject.add_transaction(date: '06/04/2021', type: 'credit', amount: 500)

        expect(subject.transaction_history.length).to eq(1)
        expect(subject.transaction_history.first).to be(transaction)
      end

      it 'updates the account balance' do
        transaction_class = class_double('Transaction', new: transaction).as_stubbed_const
        subject.add_transaction(date: '06/04/2021', type: 'credit', amount: 500)

        expect(subject.transaction_history.length).to eq(1)
        expect(subject.transaction_history.first).to be(transaction)
        expect(subject.account_balance).to eq(1000)
      end
    end
  end
end
