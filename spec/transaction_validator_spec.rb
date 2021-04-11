# frozen_string_literal: true

require 'transaction_validator'

RSpec.describe TransactionValidator do
  subject { described_class }

  describe '.check' do
    it 'will not accept a negative number' do
      expect(subject.check(:credit, -1000, 5000))
        .to eq('Please enter a valid amount.')
    end

    it 'will not accept a non-integer as an amount' do
      expect(subject.check(:credit, 'one thousand', 5000))
        .to eq('Please enter a valid amount.')
      expect(subject.check(:credit, 1045.67, 5000))
        .to eq('Please enter a valid amount.')
    end

    it 'will not allow the user account to become overdrawn' do
      expect(subject.check(:debit, 1000, 500))
        .to eq('You cannot withdraw that much; please try again.')
    end

    it 'clears valid transactions' do
      expect(subject.check(:credit, 1000, 500)).to eq(nil)
    end
  end
end
