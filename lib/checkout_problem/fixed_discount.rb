class FixedDiscount < Discount
  def net_price(total_price)
    [total_price - discount_value, 0].max
  end
end
