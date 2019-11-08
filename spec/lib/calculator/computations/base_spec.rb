# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Calculator::Computations::Base do
  describe '.call!' do
    it 'requires parameters' do
      expect { described_class.call! }.to raise_error(ArgumentError)
    end

    it 'has abstract method' do
      expect { described_class.call!({}) }.to raise_error(NotImplementedError)
    end
  end
end
