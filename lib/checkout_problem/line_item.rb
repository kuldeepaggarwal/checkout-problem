class LineItem
  attr_accessor :quantity
  attr_reader :product
  def initialize(product)
    @product = product
    @quantity = 0
  end

  def price
    product.price * quantity
  end
end
