# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Calculator::Computations::NetAmount do
  describe '.call!' do
    let!(:context) do
      {
        amount: 100.to_d,
        commission_total: 21.to_d
      }
    end

    it 'computes net amount' do
      result = described_class.call!(context)

      expect(result).to eq(79.0)
    end
  end
end
