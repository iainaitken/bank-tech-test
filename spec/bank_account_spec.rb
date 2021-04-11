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

# Notes for testing behaviour not state. 
# deposit invokes add_transaction.
# Add_transaction invokes TransactionValidator
# Should stub TransactionValidator - do we need to inject that?
# add_transaction then calls Transaction.new
# need to stub Transaction
# print_statement then calls Statement, which relies on data from Transaction
# need to stub Statement, (and transaction again?)
# What are we testing? We're not testing the stubbed classes, we're testing 
# whether Statement receives the print command

# Also can I cut down code in transaction validator? No need to check type now as that 
# is hard-coded into the program

  describe '#deposit' do
    let(:transaction1) { instance_double(Transaction, date: '06/04/2021', type: :credit, amount: 500, balance: 500) }
    
    context 'transaction passes validation checks' do
      it 'adds a transaction to the stored list' do
        transaction_class = class_double('Transaction', new: transaction1).as_stubbed_const
        subject.deposit(amount: 500)
        
        expect(subject.transaction_history.length).to eq(1)
        expect(subject.transaction_history.first).to be(transaction1)
      end
    end
  end
  
  describe '#withdraw' do
    let(:transaction1) { instance_double(Transaction, date: '06/04/2021', type: :credit, amount: 500, balance: 500) }
    let(:transaction2) { instance_double(Transaction, date: '06/04/2021', type: :debit, amount: 250, balance: 750) }

    context 'transaction passes validation checks' do
      it 'adds a transaction to the stored list' do
        transaction_class = class_double('Transaction').as_stubbed_const
        allow(transaction_class).to receive(:new).and_return(transaction1, transaction2)

        subject.deposit(amount: 500)
        subject.withdraw(amount: 250)

        expect(subject.transaction_history.length).to eq(2)
        expect(subject.transaction_history.first).to be(transaction1)
        expect(subject.transaction_history.last).to be(transaction2)
      end
    end
  end

  describe '#print_statement' do
    it 'passes a print message to the Statement class to print out the transaction history' do
      statement_class = class_double('Statement', print: "test print").as_stubbed_const
      
      expect(subject.print_statement).to eq("test print")
    end
  end
end
