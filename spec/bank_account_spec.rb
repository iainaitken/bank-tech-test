# frozen_string_literal: true

require 'bank_account'
require 'statement'

RSpec.describe BankAccount do
  subject { described_class.new }

  it 'knows the balance of the account' do
    expect(subject.account_balance).to eq(0)
  end

  it 'starts with an empty transaction history' do
    expect(subject.transaction_history).to eq([])
  end

  describe '#deposit' do
    let(:transaction1) { instance_double(Transaction, date: '06/04/2021', type: :credit, amount: 500, balance: 500) }

    context 'transaction passes validation checks' do
      it 'stores the transaction' do
        validator_class = class_double(TransactionValidator, check: nil).as_stubbed_const
        transaction_class = class_double(Transaction).as_stubbed_const
        allow(transaction_class).to receive(:new).and_return(transaction1)

        expect(subject.deposit(amount: 500)).to eq('You have deposited £500.00 into your account.')
      end
    end
  end

  describe '#withdraw' do
    let(:transaction1) { instance_double(Transaction, date: '06/04/2021', type: :credit, amount: 500, balance: 500) }
    let(:transaction2) { instance_double(Transaction, date: '06/04/2021', type: :debit, amount: 250, balance: 250) }

    context 'transaction passes validation checks' do
      it 'stores the transaction' do
        validator_class = class_double(TransactionValidator, check: nil).as_stubbed_const
        transaction_class = class_double(Transaction).as_stubbed_const
        allow(transaction_class).to receive(:new).and_return(transaction1, transaction2)

        subject.deposit(amount: 500)

        expect(subject.withdraw(amount: 250)).to eq('You have withdrawn £250.00 from your account.')
      end
    end
  end

  describe '#print_statement' do
    it 'passes a print message to the Statement class to print out the transaction history' do
      statement_class = class_double('Statement', print: 'test print').as_stubbed_const

      expect(subject.print_statement).to eq('test print')
    end
  end
end
