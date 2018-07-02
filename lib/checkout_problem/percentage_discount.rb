class PercentageDiscount < Discount
  def net_price(total_price)
    [total_price * ((100 - discount_value) / 100.0), 0].max
  end
end
