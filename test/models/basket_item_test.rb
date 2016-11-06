require 'test_helper'

class BasketItemTest < ActiveSupport::TestCase

  test "should require a product" do
    basket_item = BasketItem.new
    assert_not basket_item.valid?
    assert_not_empty basket_item.errors.details[:product]
  end

  test "should validate with correct parameters" do
    product = build(:product)
    basket_item = BasketItem.new
    basket_item.product = product

    assert basket_item.valid?
  end

end
