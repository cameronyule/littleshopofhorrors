require 'test_helper'

class BasketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shopper = create(:shopper)
  end

  test "should show basket" do
    get basket_url :shopper_id => @shopper.id.to_s, as: :json
    assert_response :success
  end

  test "should update basket" do
    patch basket_url, params: { shopper_id: @shopper.id.to_s, basket: {  } }, as: :json
    assert_response 200
  end

  test "should destroy basket" do
    delete basket_url, params: { shopper_id: @shopper.id.to_s }, as: :json
    assert_response 204

    updated_shopper = Shopper.find(@shopper.id)
    assert_nil updated_shopper.basket
  end
end
