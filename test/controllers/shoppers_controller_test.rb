require 'test_helper'

class ShoppersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shopper = create(:shopper)
  end

  # test "should get index" do
  #   get shoppers_url, as: :json
  #   assert_response :success
  # end

  test "should create shopper" do
    @shopper = build(:shopper)
    assert_difference('Shopper.count') do
      post shoppers_url, params: { shopper: { email: @shopper.email, name: @shopper.name } }, as: :json
    end

    assert_response 201
  end

  test "should show shopper" do
    get shopper_url(@shopper), as: :json
    assert_response :success
  end

  test "should update shopper" do
    patch shopper_url(@shopper), params: { shopper: { email: @shopper.email, name: @shopper.name } }, as: :json
    assert_response 200
  end

  test "should destroy shopper" do
    assert_difference('Shopper.count', -1) do
      delete shopper_url(@shopper), as: :json
    end

    assert_response 204
  end
end
