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

end
