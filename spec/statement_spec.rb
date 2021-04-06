require 'statement'

RSpec.describe Statement do
  subject { described_class }

  describe '.load' do
    it 'loads the contents of the statement csv file' do
      expect(subject.load).to eq(["date,credit,debit,balance"])
    end
  end
end