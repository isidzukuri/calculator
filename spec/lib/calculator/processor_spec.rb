require 'spec_helper'

RSpec.describe Calculator::Processor do
  describe '.new' do
    it 'has required parameter :amount' do
      expect { described_class.new({}) }.to raise_error(ArgumentError, "missing parameter :amount")
    end
  end

  describe '.call' do
    let!(:amount) {100}
    let!(:commission_amount) {1.0}
    let!(:commission_percent) {20}

    it "computes commissions" do
      result = described_class.new(
        amount: amount,
        commission_amount: commission_amount,
        commission_percent: commission_percent).call

      expect(result).to eq([79.0, 21.0])
    end

    it 'accepts :commission_entity parameter' do
      result = described_class.new(
        amount: amount,
        commission_entity: nil).call

      expect(result).to eq([100, 0])
    end
  end

end
