class Checkout
  def initialize(rules = CheckoutRules.new)
    @items = {}
    @rules = rules
  end

  def scan(product_code)
    @items[product_code] ||= LineItem.new(Product.find_by_code(product_code))
    @items[product_code].quantity += 1
  end

  def item_count
    @items.count
  end

  # +net_price+ makes more sense here.
  def net_price
    rules.apply(total_price, items)
  end
  alias_method :total, :net_price

  private

    attr_reader :rules

    def total_price
      items.sum(&:price)
    end

    def items
      @items.values
    end
end
