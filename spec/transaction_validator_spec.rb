require 'transaction_validator' 

RSpec.describe TransactionValidator do
  subject { described_class }

  describe '.check' do
    it 'will not accept a negative number' do
      expect(subject.check('06/04/2021', 'credit', -1000))
        .to eq('Please enter a valid number.')
    end
  end
end