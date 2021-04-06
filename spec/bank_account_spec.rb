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

    it 'increases the users account balance' do
      subject.deposit_funds(1000.00)

      expect(subject.balance).to eql(1000.00)
    end

    it 'will not accept a negative number' do
      deposit = -1000.00
      expect(subject.deposit_funds(deposit)).to eq("Please enter a valid number.")
    end
  end

  describe '#withdraw_funds' do
    it 'allows the user to withdraw money from the account' do
      deposit = 1000.00
      subject.deposit_funds(deposit)
      withdrawal = 500.00

      expect(subject.withdraw_funds(withdrawal)).to eq("You have withdrawn £#{withdrawal} from your account.")
    end

    it 'decreases the users account balance' do
      subject.deposit_funds(1000.00)
      subject.withdraw_funds(500.00)
      
      expect(subject.balance).to eql(500.00)
    end
  end
end