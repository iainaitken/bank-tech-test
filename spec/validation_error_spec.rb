# frozen_string_literal: true

require 'validation_error'

RSpec.describe ValidationError do
  subject { described_class.new('Please enter a valid amount') }

  it 'is an error' do
    expect(subject).to be_a(StandardError)
  end

  it 'takes a message as an argument on intialization' do
    expect(subject.message).to eq('Please enter a valid amount')
  end
end
