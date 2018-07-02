require 'spec_helper'

describe Checkout do
  let(:item) { Product.create(code: 'A201', price: 23, currency: 'USD') }

  describe '#scan' do

    it 'scans the item in the checkout' do
      expect { subject.scan(item) }.to change(subject, :count).by(1)
    end
  end

  describe '#total' do
    before do
      subject.scan(item)
    end

    it 'returns the total amount to be paid' do
      expect(subject.total).to eq(23)
    end
  end
end
