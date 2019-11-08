# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Calculator::Computations::CommissionTotal do
  describe '.call!' do

    let!(:context) do
      {
        amount: 100.to_d,
        rates: {
          commission_percent: 20,
          commission_amount: 1.0
        }
      }
    end

    let!(:context_zero_rates) do
      {
        amount: 100.to_d,
        rates: {
          commission_percent: 0,
          commission_amount: 0
        }
      }
    end

    let!(:context_decimal_commission_percent) do
      {
        amount: 100.to_d,
        rates: {
          commission_percent: 33.333,
          commission_amount: 0
        }
      }
    end

    it 'computes commission total' do
      result = described_class.call!(context)

      expect(result).to eq(21.0)
    end

    it 'computes commission total' do
      result = described_class.call!(context_zero_rates)

      expect(result).to eq(0)
    end

    it 'computes with precision 2 decimals' do
      result = described_class.call!(context_decimal_commission_percent)

      expect(result).to eq(33.33)
    end
  end
end
