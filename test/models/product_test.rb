require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "should require a name" do
    p = Product.create description: "test", price: 10
    assert_not p.valid?
    assert_not_empty p.errors.details[:name]
  end

  test "should require a description" do
    p = Product.create name: "test", price: 10
    assert_not p.valid?
    assert_not_empty p.errors.details[:description]
  end

  test "should require a price" do
    p = Product.create name: "test", description: "test"
    assert_not p.valid?
    assert_not_empty p.errors.details[:price]
  end

  test "should require a price greater than 0" do
    p = Product.create name: "test", description: "test", price: 0
    assert_not p.valid?
    assert_not_empty p.errors.details[:price]
  end

  test "should validate with correct parameters" do
    p = Product.create name: "test", description: "test", price: 1
    assert p.valid?
    assert_empty p.errors
  end

  test "should format price for display" do
    p = Product.create name: "test", description: "test", price: 5273
    assert_equal "£52.73", p.display_price
  end

end
