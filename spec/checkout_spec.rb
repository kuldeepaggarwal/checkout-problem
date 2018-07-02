require 'spec_helper'

describe Checkout do
  before do
    Product.create(code: '001', price: 1.95, currency: 'USD')
    Product.create(code: '002', price: 5.99, currency: 'USD')
    Product.create(code: '003', price: 25.00, currency: 'USD')
  end

  describe '#scan' do
    it 'scans the item in the checkout' do
      expect { subject.scan('001') }.to change(subject, :item_count).by(1)
      expect { subject.scan('001') }.not_to change(subject, :item_count)
    end
  end

  describe '#total' do
    before do
      subject.scan('003')
      subject.scan('003')
    end

    it 'returns the total amount to be paid' do
      expect(subject.total).to eq(50)
    end
  end
end
