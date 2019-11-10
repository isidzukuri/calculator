# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Calculator::Context do
  let!(:amount) { 100 }
  let!(:commission_amount) { 1.0 }
  let!(:commission_percent) { 20 }
  let!(:params) do
    {
      amount: amount,
      commission_amount: commission_amount,
      commission_percent: commission_percent
    }
  end

  describe '.new' do
    it 'has required parameter :amount' do
      expect { described_class.new({}) }.to raise_error(ArgumentError, 'missing parameter :amount')
    end

    it 'creates structure with attributes' do
      expect(Calculator::Context).to receive(:new).and_call_original

      context = described_class.new(params)

      expect(context[:amount]).to eq(amount)
      expect(context[:rates]).to be_a(Hash)
    end
  end

  it 'allows to add new attributes' do
    context = described_class.new(params)

    context[:new_attr] = 1
    expect(context[:new_attr]).to eq(1)
  end
end
