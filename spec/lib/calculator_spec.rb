# frozen_string_literal: true

RSpec.describe Calculator do
  it 'has a version number' do
    expect(Calculator::VERSION).not_to be nil
  end

  describe '.call' do
    let!(:amount) { 100 }
    let!(:commission_amount) { 1.0 }
    let!(:commission_percent) { 20 }

    it 'computes commissions' do
      result = described_class.call(
        amount: amount,
        commission_amount: commission_amount,
        commission_percent: commission_percent
      )

      expect(result).to eq([79.0, 21.0])
    end
  end
end
