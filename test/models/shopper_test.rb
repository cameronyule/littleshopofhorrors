require 'test_helper'

class ShopperTest < ActiveSupport::TestCase

  test "automatically creates a Basket instance" do
    s = Shopper.new name: "Test", email: "test@example.org"

    assert_not_nil s.basket
  end

  test "should require a name" do
    s = Shopper.new email: "test@example.org"
    assert_not s.valid?
    assert_not_empty s.errors.details[:name]
  end

  test "should require an email address" do
    s = Shopper.new name: "cameron"
    assert_not s.valid?
    assert_not_empty s.errors.details[:email]
  end

  test "should require a unique email address" do
    s1 = create(:shopper)
    s2 = build(:shopper)

    assert_not s2.valid?
    assert_not_empty s2.errors.details[:email]
  end

end
