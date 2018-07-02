require 'spec_helper'

describe NoDiscount do
  describe '#net_price' do
    it 'returns price after discount' do
      expect(subject.net_price(200)).to eq(200)
    end
  end

  describe '#discount' do
    it 'returns the discount amount' do
      expect(subject.discount(200)).to eq(0)
    end
  end
end
