require 'test_helper'

class ShopperTest < ActiveSupport::TestCase

  test "automatically creates a Basket instance" do
    s = Shopper.new name: "Test", email: "test@example.org"

    assert_not_nil s.basket
  end

end
