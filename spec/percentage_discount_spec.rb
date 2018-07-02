require 'spec_helper'

describe PercentageDiscount do
  describe 'net_price' do
    it 'returns price after discount' do
      expect(described_class.new(2).net_price(20)).to eq(19.6)
      expect(described_class.new(120).net_price(20)).to eq(0)
    end
  end
end
