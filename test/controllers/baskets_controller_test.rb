require 'test_helper'

class BasketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shopper = create(:shopper)
    @products = [create(:product), create(:product)]
  end

  test "routes should be defined" do
    assert_routing "/api/shoppers/1/basket",
      controller: "baskets",
      action: "show",
      shopper_id: "1"
  end

  test "should show basket" do
    get shopper_basket_url :shopper_id => @shopper.id.to_s, as: :json
    assert_response :success

    json = JSON.parse(@response.body)

    assert_equal @shopper.basket.id.to_s, json["id"]
    assert_equal @shopper.basket.products.count, json["products"].count
  end

  test "should update basket" do
    patch shopper_basket_url shopper_id: @shopper.id.to_s, params: {
      product_ids: @products.map{|p| p.id.to_s}
    }, as: :json

    @shopper.basket.reload

    assert_response 200
    assert_equal 2, @shopper.basket.products.count
  end

  test "should destroy basket" do
    delete shopper_basket_url shopper_id: @shopper.id.to_s, as: :json
    assert_response 204

    @shopper.reload

    assert_nil @shopper.basket
  end
end
