require 'bank_account'

RSpec.describe BankAccount do
  subject { described_class.new }

  it 'knows the balance of the account' do
    expect(subject.balance).to eq(0)
  end
end