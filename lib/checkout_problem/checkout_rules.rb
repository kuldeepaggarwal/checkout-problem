# This class will be responsible for applying the codes in a certain order
class CheckoutRules
  def initialize(rules = [])
    @rules = rules
  end

  def apply(total_price, items)
    @rules.permutation.map do |_rules|
      _rules.inject(total_price) do |result, rule|
        result = rule.apply(items).net_price(result)
      end
    end.max.round(2)
  end
end
