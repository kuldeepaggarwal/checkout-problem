class Checkout
  def initialize
    @items = {}
  end

  def scan(product_code)
    @items[product_code] ||= LineItem.new(Product.find_by_code(product_code))
    @items[product_code].quantity += 1
  end

  def item_count
    @items.count
  end

  def total
    @items.inject(0) { |acc, (_, item)| acc += item.price }
  end
end
