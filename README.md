# checkout-problem

This is a small implementation for checkout system which can scan the product in any order and apply some checkout rules(if available) and provide min discount to achieve max profit to the organization.

#### Prerequisite

* Ruby > 2.2.5

### How to play with the project

#### Adding the Product

```rb
Product.create(code: '001', price: 12.32, currency: 'USD')
Product.create(code: '002', price: 25.00, currency: 'USD')
Product.create(code: '003', price: 5.00, currency: 'USD')
```

### Creating a CheckoutRules

```
rules = [
          Promotion.new(
            ->(items) { items.sum(&:price) >= 3 },
            PercentageDiscount.new(10)
          ),
          Promotion.new(
            ->(items) do
              item = items.detect { |item| item.product_code == '002' }
              item && item.quantity >= 3
            end,
            FixedDiscount.new(3.99)
          )
        ]
checkout_rules =  CheckoutRules.new(rules)
```

There are 2 kinds of discount that we can provide, *Fixed* or *Percentage*. We can add as many as rules we wish.

### Creating a Checkout

```
# Products and Checkout rules have already been created as mentioned above.

co = Checkout.new(checkout_rules)
co.scan('001')
co.scan('002')
price = co.total
```

### Testing

```shell
$ cd [path-to-project]
$ gem install bundler # this command will be executed if bundler is not installed
$ bundle install
$ bundle exec rspec spec
```

### Enhancements

1. Currency consideration is needed while calculation of total during checkout.
2. We can add another strategy to apply checkout rules
