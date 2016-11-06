require 'test_helper'

class CheckoutFlowTest < ActionDispatch::IntegrationTest

  test "adding products to the basket then checking out" do
    # Create a new shopper
    shopper = create(:shopper)

    # Create some products to work with
    products = FactoryGirl.create_list(:product, 3)
    product_ids = products.map{|p| p.id.to_s}

    # Add some products to the shopper's basket
    put shopper_basket_url(shopper.id.to_s), params: {
      product_ids: product_ids
    }, as: :json

    # Submit our basket to the checkout process
    post shopper_checkout_url(shopper), params: {}, as: :json

    # We should receive an order
    order_json = JSON.parse(@response.body)

    # Default product price is 1 and we had 3 products
    assert_equal 3, order_json["total"]
  end

end
