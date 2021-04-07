require 'transaction'

RSpec.describe Transaction do
  subject { described_class.new(date: '06/04/2021', type: 'credit', amount: '500') }

  it 'stores the date of a transaction' do
    expect(subject.date).to eq('06/04/2021')
  end

  it 'stores the type of the transaction' do
    expect(subject.type).to eq(:credit)
  end

  it 'stores the amount of the transaction' do
    expect(subject.amount).to eq(500)
  end
end