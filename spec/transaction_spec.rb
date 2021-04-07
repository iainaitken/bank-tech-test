# frozen_string_literal: true

require 'transaction'

RSpec.describe Transaction do
  subject do
    described_class.new('06/04/2021', 'credit', 500, 500)
  end

  it 'stores the date of a transaction' do
    expect(subject.date).to eq('06/04/2021')
  end

  it 'stores the type of the transaction' do
    expect(subject.type).to eq('credit')
  end

  it 'stores the amount of the transaction' do
    expect(subject.amount).to eq(500)
  end

  it 'stores the updated balance of the account' do
    expect(subject.balance).to eq(1000)
  end
end
