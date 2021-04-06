require 'transaction'

RSpec.describe Transaction do
  subject { described_class.new(date: "06/04/2021", credit: "500", debit: "", balance: "500") }

  it 'stores the date of a transaction' do
    expect(subject.date).to eq("06/04/2021")
  end

  it 'stores the credit/debit amount' do
    expect(subject.credit).to eq(500)
    expect(subject.debit).to eq(nil)
  end

  it 'stores the account balance' do
    expect(subject.balance).to eq(500)
  end
end