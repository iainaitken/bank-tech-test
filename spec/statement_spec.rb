# frozen_string_literal: true

require 'statement'

RSpec.describe Statement do
  subject { described_class.new }

  it 'starts with an empty list of transactions' do
    expect(subject.list_transactions).to eq([])
  end

  describe '#add_transaction' do
    let(:transaction) { instance_double(Transaction, date: '06/04/2021', type: :credit, amount: 500, balance: 1000) }
    it 'adds a transaction to the stored list' do
      subject.add_transaction(transaction)

      expect(subject.list_transactions.length).to eq(1)
      expect(subject.list_transactions.first).to be(transaction)
    end
  end
end
