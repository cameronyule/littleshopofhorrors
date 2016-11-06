require 'test_helper'

class LineItemTest < ActiveSupport::TestCase

  test "should calculate the cost of the line item" do
    line_item = build(:line_item, quantity: 3)
    line_item.product = build(:product, price: 100)

    assert_equal 300, line_item.cost
  end

  test "should create a line item from a product" do
    product = build(:product)
    line_item = LineItem.create_from_product(product)

    assert_equal product.price, line_item.cost
  end

end
