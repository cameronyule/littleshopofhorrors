require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = create(:product)
  end

  test "routes should be defined" do
    assert_routing "/api/products/1",
      controller: "products",
      action: "show",
      id: "1"
  end

  test "should get index" do
    get products_url, as: :json
    assert_response :success
  end

  test "should return expect json format" do
    get products_url, as: :json

    products = JSON.parse @response.body
    products = products.map{|p| Product.new(p.except("display_price")) }

    assert_equal @product.name, products.first.name
    assert_equal @product.description, products.first.description
    assert_equal @product.price, products.first.price
  end

  test "should create product" do
    @product = build(:product)
    assert_difference('Product.count') do
      post products_url, params: {
        description: @product.description,
        name: @product.name,
        price: @product.price
       }, as: :json
    end

    assert_response :created
  end

  test "should show product" do
    get product_url(@product), as: :json
    assert_response :success
  end

  test "should update product" do
    @product = create(:product)
    patch product_url(@product), params: {
      description: @product.description,
      name: @product.name,
      price: @product.price
    }, as: :json
    assert_response :ok
  end

  test "should destroy product" do
    @product = create(:product)
    assert_difference('Product.count', -1) do
      delete product_url(@product), as: :json
    end

    assert_response :no_content
  end
end
