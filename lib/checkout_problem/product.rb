class Product
  attr_reader :price, :code
  def initialize(code:, price:, currency:)
    @code = code
    @price = price
    @currency = currency
  end

  class << self
    def create(code:, price:, currency:)
      _all[code] ||= new(code: code, price: price, currency: currency)
    end

    def all
      _all.values
    end

    def count
      _all.count
    end

    def find_by_code(code)
      _all[code]
    end

    private

      def _all
        @all ||= {}
      end
  end
end
