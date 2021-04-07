require 'transaction_validator' 

RSpec.describe TransactionValidator do
  subject { described_class }

  describe '.check' do
    it 'will not accept a negative number' do
      expect(subject.check(date: '06/04/2021', type: 'credit', amount: -1000))
        .to eq('Please enter a valid amount.')
    end

    it 'will not accept a string as an amount' do
      expect(subject.check(date: '06/04/2021', type: 'credit', amount: 'one thousand'))
        .to eq('Please enter a valid amount.')
    end

    it 'will not accept an invalid transaction type' do
      expect(subject.check(date: '06/04/2021', type: 'crdit', amount: 1000))
        .to eq('Please enter a valid transaction type.')
    end
  end
end