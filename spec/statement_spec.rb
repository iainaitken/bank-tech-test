require 'statement'

RSpec.describe Statement do
  subject { described_class.new }

  it 'starts with an empty list of transactions' do
    expect(subject.list_transactions).to eq([])
  end

  # describe '#add_transaction' do
  #   it 'stores a list of transactions' do
      
  #   end
  # end
end