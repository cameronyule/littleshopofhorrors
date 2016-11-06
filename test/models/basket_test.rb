require 'test_helper'

class BasketTest < ActiveSupport::TestCase

  test "should contain an empty products array after initialisation" do
    basket = Basket.new
    assert_empty basket.products
  end

end
