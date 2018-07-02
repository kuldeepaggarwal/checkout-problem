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
    context 'without promotional discounts' do
      before do
        subject.scan('003')
        subject.scan('003')
      end

      it 'returns the total amount to be paid' do
        expect(subject.total).to eq(50)
      end
    end

    context 'without promotional discounts' do
      let(:rules) do
        [
          Promotion.new(
            ->(items) { items.sum(&:price) >= 30 },
            PercentageDiscount.new(10)
          ),
          Promotion.new(
            ->(items) do
              item = items.detect { |item| item.product_code == '002' }
              item && item.quantity >= 2
            end,
            FixedDiscount.new(3.99)
          )
        ].shuffle
      end

      context 'when first promotional code is applicable' do
        it 'returns the total amount to be paid after applying all promotions' do
          subject = described_class.new(rules)
          subject.scan('001')
          subject.scan('002')
          subject.scan('003')
          expect(subject.total).to eq(29.65)
        end
      end

      context 'when last promotional code is applicable' do
        it 'returns the total amount to be paid after applying all promotions' do
          subject = described_class.new(rules)
          subject.scan('002')
          subject.scan('001')
          subject.scan('002')
          # original test case value is wrong
          expect(subject.total).to eq(9.94)
        end
      end

      context 'when both promotional code is applicable' do
        it 'returns the total amount to be paid after applying all promotions' do
          [rules, rules.reverse].each do |_rules|
            subject = described_class.new(_rules)
            subject.scan('002')
            subject.scan('001')
            subject.scan('002')
            subject.scan('003')
            # original test case value is wrong
            expect(subject.total).to eq(31.45)
          end
        end
      end
    end
  end
end
