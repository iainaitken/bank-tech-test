# frozen_string_literal: true

require 'bank_account'

RSpec.describe BankAccount do
  subject { described_class.new }

  it 'knows the balance of the account' do
    expect(subject.balance).to eq('£0.00')
  end

  it 'starts with an empty transaction history' do
    expect(subject.transaction_history).to eq([])
  end

  describe '#add_transaction' do
    let(:transaction) { instance_double(Transaction, date: '06/04/2021', type: :credit, amount: 500, balance: 1000) }
    
    context 'transaction passes validation checks' do
      it 'adds a transaction to the stored list' do
        transaction_class = class_double('Transaction', new: transaction).as_stubbed_const
        subject.add_transaction('06/04/2021', 'credit', 500)
  
        expect(subject.transaction_history.length).to eq(1)
        expect(subject.transaction_history.first).to be(transaction)
      end
      
      #  it 'updates the account balance' do
      # 
      # end
    end
  end
end
  # describe '#deposit_funds' do
  #   it 'lets the user add funds' do
  #     expect(subject.deposit_funds(1000))
  #       .to eq("You have deposited £10.00 into your account. Your balance is now #{subject.balance}")
  #   end

  #   it 'increases the users account balance' do
  #     subject.deposit_funds(1000)
  #     expect(subject.balance).to eql('£10.00')
  #   end

  # end

  # describe '#withdraw_funds' do
  #   it 'allows the user to withdraw money from the account' do
  #     subject.deposit_funds(1000)
  #     expect(subject.withdraw_funds(500))
  #       .to eq('You have withdrawn £5.00 from your account.')
  #   end

  #   it 'decreases the users account balance' do
  #     subject.deposit_funds(1000)
  #     subject.withdraw_funds(500)
  #     expect(subject.balance).to eql('£5.00')
  #   end


  # end

  # describe 'print_statement' do
  #   it 'prints out the transaction history for the account' do
      
  #   end
  # end

