class Discount
  attr_reader :discount_value
  def initialize(discount_value)
    @discount_value = discount_value
  end

  def net_price(total_price)
    raise NotImplementedError
  end
end
