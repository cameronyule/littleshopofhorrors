require 'test_helper'

class ShoppersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shopper = create(:shopper)
  end

  test "routes should be defined" do
    assert_routing "/api/shoppers/1",
      controller: "shoppers",
      action: "show",
      id: "1"
  end

  test "should create shopper" do
    @shopper = build(:shopper)

    assert_difference('Shopper.count') do
      post shoppers_url, params: {
        shopper: {
          email: @shopper.email,
          name: @shopper.name
        }
      }, as: :json
    end
    assert_response :created
  end

  test "should return a JSON serialised instance of the shopper" do
    @shopper = build(:shopper)

    post shoppers_url, params: {
      shopper: {
        email: @shopper.email,
        name: @shopper.name
      }
    }, as: :json

    json = JSON.parse(@response.body)

    assert_equal @shopper.name, json["name"]
    assert_equal @shopper.email, json["email"]
    assert_not_nil json["basket"]
  end

  test "should show shopper" do
    get shopper_url(@shopper), as: :json
    assert_response :success
  end

  test "should update shopper" do
    patch shopper_url(@shopper), params: {
      shopper: {
        email: @shopper.email,
        name: @shopper.name
      }
    }, as: :json
    assert_response :ok
  end

  test "should destroy shopper" do
    assert_difference('Shopper.count', -1) do
      delete shopper_url(@shopper), as: :json
    end
    assert_response :no_content
  end
end
