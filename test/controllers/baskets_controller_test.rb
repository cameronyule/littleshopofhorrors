require 'test_helper'

class BasketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shopper = create(:shopper)
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

    basket_json = JSON.parse(@response.body)
    basket = Basket.new(basket_json)

    assert_equal @shopper.basket.id.to_s, basket.id.to_s
    assert_equal @shopper.basket.items.count, basket.items.count
  end

  test "should update basket" do
    products = [create(:product), create(:product)]

    patch shopper_basket_url shopper_id: @shopper.id.to_s, params: {
      product_ids: products.map{|p| p.id.to_s}
    }, as: :json

    @shopper.basket.reload

    assert_response :ok
    assert_equal 2, @shopper.basket.items.count
  end

  test "should empty basket products" do
    delete shopper_basket_url shopper_id: @shopper.id.to_s, as: :json
    assert_response :no_content

    @shopper.reload

    assert_empty @shopper.basket.items
  end
end
