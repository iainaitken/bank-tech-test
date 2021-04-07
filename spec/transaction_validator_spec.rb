require 'transaction_validator' 

RSpec.describe TransactionValidator do
  subject { described_class }

  describe '.check' do
    it 'will not accept a negative number' do
      expect(subject.check('06/04/2021', 'credit', -1000, 5000))
        .to eq('Please enter a valid amount.')
    end

    it 'will not accept a string as an amount' do
      expect(subject.check('06/04/2021', 'credit', 'one thousand', 5000))
        .to eq('Please enter a valid amount.')
    end

    it 'will not accept a float as an amount' do
      expect(subject.check('06/04/2021', 'credit', 1045.67, 5000))
        .to eq('Please enter a valid amount.')
    end

    it 'will not accept an invalid transaction type' do
      expect(subject.check('06/04/2021', 'crdit', 1000, 5000))
        .to eq('Please enter a valid transaction type.')
    end

    it 'will not allow the user account to become overdrawn' do
      expect(subject.check('06/04/2021', 'debit', 1000, 500))
        .to eq('You cannot withdraw that much; please try again.')
    end

    it 'clears valid transactions' do
      expect(subject.check('06/04/2021', 'credit', 1000, 500))
        .to eq('OK')
    end
  end
end