class Checkout
  def initialize
    @items = {}
  end

  def scan(product_code)
    @items[product_code] ||= Product.find_by_code(product_code)
  end

  def count
    @items.count
  end

  def total
    @items.inject(0) { |acc, (_, item)| acc += item.price }
  end
end
