# frozen_string_literal: true

require 'bank_account'

RSpec.describe BankAccount do
  subject { described_class.new }

  it 'knows the balance of the account' do
    expect(subject.balance).to eq('£0.00')
  end

  describe '#deposit_funds' do
    it 'lets the user add funds' do
      expect(subject.deposit_funds(1000))
        .to eq("You have deposited £10.00 into your account. Your balance is now #{subject.balance}")
    end

    it 'increases the users account balance' do
      subject.deposit_funds(1000)
      expect(subject.balance).to eql('£10.00')
    end

    it 'will not accept a negative number' do
      expect(subject.deposit_funds(-1000))
        .to eq('Please enter a valid number.')
    end
  end

  describe '#withdraw_funds' do
    it 'allows the user to withdraw money from the account' do
      subject.deposit_funds(1000)
      expect(subject.withdraw_funds(500))
        .to eq("You have withdrawn £5.00 from your account.")
    end

    it 'decreases the users account balance' do
      subject.deposit_funds(1000)
      subject.withdraw_funds(500)
      expect(subject.balance).to eql('£5.00')
    end

    it 'will not allow the account to be overdrawn' do
      subject.deposit_funds(1000)
      expect(subject.withdraw_funds(1500))
        .to eq("You cannot withdraw that much; your account balance is #{subject.balance}.")
    end
  end
end
