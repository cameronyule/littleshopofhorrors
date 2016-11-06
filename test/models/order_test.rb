require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  test "should correctly calculate the total value" do
    order = build(:order)
    order.line_items << build(:line_item, quantity: 2)
    order.line_items << build(:line_item)
    order.line_items << build(:line_item)

    assert_equal 4, order.total
  end

  test "should only create line items for unique products" do
    basket = build(:basket)
    item1 = build(:basket_item, product: create(:product))
    item2 = build(:basket_item, product: create(:product))
    basket.items = [item1, item1, item2]

    order = Order.new
    order.populate_from_basket(basket)

    assert_equal 2, order.line_items.size
    assert_equal 2, order.line_items[0].quantity
  end

end
