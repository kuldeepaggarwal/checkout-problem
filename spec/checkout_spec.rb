require 'spec_helper'

describe Checkout do
  before do
    Product.create(code: 'A201', price: 23, currency: 'USD')
  end

  describe '#scan' do
    it 'scans the item in the checkout' do
      expect { subject.scan('A201') }.to change(subject, :item_count).by(1)
      expect { subject.scan('A201') }.not_to change(subject, :item_count)
    end
  end

  describe '#total' do
    before do
      subject.scan('A201')
      subject.scan('A201')
    end

    it 'returns the total amount to be paid' do
      expect(subject.total).to eq(46)
    end
  end
end
