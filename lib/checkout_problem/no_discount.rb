class NoDiscount < Discount
  def initialize
  end

  def discount(*)
    0
  end
end
