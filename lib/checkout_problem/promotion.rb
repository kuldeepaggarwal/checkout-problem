class Promotion
  def initialize(rule, discount)
    @rule = rule
    @discount = discount
  end

  def apply(items)
    if rule.call(items)
      discount
    else
      NoDiscount.new
    end
  end

  private

    attr_reader :rule, :discount
end
