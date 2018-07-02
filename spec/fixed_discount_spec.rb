require 'spec_helper'

describe FixedDiscount do
  subject { described_class.new(10) }

  describe 'net_price' do
    it 'returns price after discount' do
      expect(subject.net_price(200)).to eq(190)
      expect(subject.net_price(2)).to eq(0)
    end
  end
end
