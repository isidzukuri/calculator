# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Calculator do
  it 'has a version number' do
    expect(Calculator::VERSION).not_to be nil
  end

  describe '.call' do
    let!(:amount) { 100 }
    let!(:commission_amount) { 1.0 }
    let!(:commission_percent) { 20 }

    it 'has required parameter :amount' do
      expect { described_class.call({}) }.to raise_error(ArgumentError, 'missing parameter :amount')
    end

    it 'computes commissions' do
      result = described_class.call(
        amount: amount,
        commission_amount: commission_amount,
        commission_percent: commission_percent
      )

      expect(result).to eq([79.0, 21.0])
    end

    it 'takes rates from :commission_entity if corresponding methots are defined' do
      result = described_class.call(
        amount: amount,
        commission_entity: Class.new
      )

      expect(result).to eq([100, 0])
    end
  end
end
