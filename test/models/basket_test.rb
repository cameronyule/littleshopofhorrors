require 'test_helper'

class BasketTest < ActiveSupport::TestCase

  test "should contain an empty items array after initialisation" do
    basket = build(:basket)
    assert_empty basket.items
  end

  test "should accept basketitems" do
    basket = build(:basket)
    basket.items << build(:basket_item)
    basket.items << build(:basket_item)
    basket.items << build(:basket_item)
    assert_equal 3, basket.items.size
  end

end
