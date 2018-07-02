RSpec.configure do |config|
  config.before(:each) do
    Product.send(:_all).clear
  end
end
