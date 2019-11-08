# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Calculator::RatesResolver do
  describe '.new' do
    it 'requires parameters' do
      expect { described_class.new.call }.to raise_error(ArgumentError)
    end
  end

  describe '.call' do
    let!(:commission_amount) { 1.0 }
    let!(:commission_percent) { 20 }

    let!(:inst_no_commissions) { described_class.new({}) }
    let!(:inst_commissions) do
      described_class.new(
        commission_amount: commission_amount,
        commission_percent: commission_amount
      )
    end

    it 'uses default rates if none given' do
      rates = inst_no_commissions.call

      expect(rates[:commission_amount]).to eq(0.0)
      expect(rates[:commission_percent]).to eq(0.0)
    end

    it 'uses given commissions' do
      rates = inst_commissions.call

      expect(rates[:commission_amount]).to eq(commission_amount)
      expect(rates[:commission_percent]).to eq(commission_amount)
    end

    context 'commission_entity' do
      class DummyCommissionEntity
      end

      class CommissionEntity
        def commission_amount
          0.3
        end

        def commission_percent
          27
        end
      end
      let!(:commission_entity) { CommissionEntity.new }
      let!(:dummy_commission_entity) { DummyCommissionEntity.new }

      let!(:inst_commission_entity) do
        described_class.new(
          commission_amount: commission_amount,
          commission_percent: commission_percent,
          commission_entity: commission_entity
        )
      end

      let!(:inst_dummy_commission_entity) do
        described_class.new(
          commission_amount: commission_amount,
          commission_percent: commission_percent,
          commission_entity: dummy_commission_entity
        )
      end

      it 'uses rites from commission_entity' do
        rates = inst_commission_entity.call

        expect(rates[:commission_amount]).to eq(commission_entity.commission_amount)
        expect(rates[:commission_percent]).to eq(commission_entity.commission_percent)
      end

      it 'fallbacks if entity does not respond to commissions methods' do
        rates = inst_dummy_commission_entity.call

        expect(rates[:commission_amount]).to eq(commission_amount)
        expect(rates[:commission_percent]).to eq(commission_percent)
      end
    end
  end
end
