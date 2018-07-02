class PercentageDiscount < Discount
  def discount(total_price)
    [total_price * (discount_value / 100.0), total_price].min
  end
end
