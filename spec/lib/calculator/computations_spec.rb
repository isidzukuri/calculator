# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Calculator::Computations do
  describe '.call!' do

    let!(:context) do
      {
        amount: 100.to_d,
        rates: {
          commission_percent: 20.to_d,
          commission_amount: 1.0.to_d
        }
      }
    end

    it 'runs all computations' do
      result = described_class.call!(context)

      expect(result[:commission_total]).to eq(21.0)
      expect(result[:net_amount]).to eq(79.0)
    end

    it 'runs all computations in the specified order' do
      expect(Calculator::Computations::CommissionTotal).to receive(:call!).ordered.and_call_original
      expect(Calculator::Computations::NetAmount).to receive(:call!).ordered.and_call_original

      described_class.call!(context)
    end

  end
end
