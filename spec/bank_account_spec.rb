require 'bank_account'

RSpec.describe BankAccount do
  subject { described_class.new }

  it 'knows the balance of the account' do
    expect(subject.balance).to eq(described_class::DEFAULT_BALANCE)
  end

  describe '#deposit_funds' do
    it 'lets the user add funds' do
      deposit = 1000.00
      expect(subject.deposit_funds(deposit)).to eq("You have deposited £#{deposit} into your account.")
    end
  end
end