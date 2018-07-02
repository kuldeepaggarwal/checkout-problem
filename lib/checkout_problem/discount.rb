class Discount
  attr_reader :discount_value
  def initialize(discount_value)
    @discount_value = discount_value
  end

  def net_price(total_price)
    total_price - discount(total_price)
  end

  def discount(total_price)
    raise NotImplementedError
  end
end
