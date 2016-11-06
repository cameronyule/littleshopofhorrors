require 'test_helper'

class BasketTest < ActiveSupport::TestCase

  test "should contain an empty products array after initialisation" do
    basket = build(:basket)
    assert_empty basket.products
  end

  test "should calculate the total price of products contained" do
    basket = build(:basket)
    basket.products << build(:product, price: 100)
    basket.products << build(:product, price: 200)
    basket.products << build(:product, price: 300)
    assert_equal 600, basket.total
  end

end
