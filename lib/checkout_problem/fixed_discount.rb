class FixedDiscount < Discount
  def discount(total_price)
    [discount_value, total_price].min
  end
end
