require 'spec_helper'

describe Product do
  describe '.create' do
    it 'adds product in the store' do
      expect(Product.count).to eq(0)
      Product.create(code: 'A101', price: 23, currency: 'USD')
      expect(Product.count).to eq(1)
    end
  end

  describe '.all' do
    let(:product) { Product.create(code: 'A101', price: 23, currency: 'USD') }

    before do
      product
    end

    it 'returns all products in the store' do
      expect(Product.all).to eq([product])
    end
  end

  describe '.find_by_code' do
    before do
      Product.create(code: 'A101', price: 23, currency: 'USD')
    end

    it 'finds the product by the product code' do
      expect(Product.find_by_code('A101')).to be_an_instance_of(Product)
    end

    it 'returns nil if product not found' do
      expect(Product.find_by_code('some-non-existing-code')).to be_nil
    end
  end
end
