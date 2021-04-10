# frozen_string_literal: true

require 'transaction'

RSpec.describe Transaction do
  subject(:transaction) { described_class.new('credit', 500, 500) }
  
  before do
    time = Time.new(2021,2,21)
    allow(Time).to receive(:now).and_return(time)
  end
  
  it 'stores the date of a transaction' do
    expect(transaction.date).to eq('21-02-2021')
  end

  it 'stores the type of the transaction' do
    expect(transaction.type).to eq('credit')
  end

  it 'stores the amount of the transaction' do
    expect(transaction.amount).to eq(500)
  end

  it 'stores the updated balance of the account' do
    expect(transaction.balance).to eq(1000)
  end
end
