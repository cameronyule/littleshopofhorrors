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

  test "should allow us to update the current items" do
    basket = build(:basket)

    products = FactoryGirl.create_list(:product, 3)
    product_ids = products.map{|p| p.id.to_s}

    basket.update_items(product_ids)

    assert_equal basket.items.size, products.count
  end

end
