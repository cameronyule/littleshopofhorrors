require 'test_helper'

class CheckoutControllerTest < ActionDispatch::IntegrationTest

  test "routes should be defined" do
    assert_routing ({
        method: "post",
        path: "/api/shoppers/1/checkout",
      }),
      controller: "checkout",
      action: "checkout",
      shopper_id: "1"
  end

  test "should return the correct error response for an empty basket" do
    # Create a shopper instance with no products in their basket
    @shopper = create(:shopper)

    post shopper_checkout_url(@shopper), params: {}, as: :json

    assert_response :unprocessable_entity
  end

  test "should create an order" do
    @shopper = create(:shopper_with_items)

    post shopper_checkout_url(@shopper), params: {}, as: :json

    order_json = JSON.parse(@response.body)

    assert_response :created
    assert_equal 2, order_json["total"]
  end

end
