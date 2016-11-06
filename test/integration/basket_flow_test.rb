require 'test_helper'

class BasketFlowTest < ActionDispatch::IntegrationTest

  test "create a user and add products to a basket" do
    # Create a new shopper
    post shoppers_url, params: {
      name: "Cameron Yule",
      email: "cameron@cameronyule.com"
    }, as: :json

    # Parse the JSON response
    shopper_json = JSON.parse(@response.body)
    shopper = Shopper.new(shopper_json)

    # Create some products to add to our basket
    products = [create(:product), create(:product)]
    product_ids = products.map{|p| p.id.to_s }

    put shopper_basket_url(shopper.id.to_s), params: {
      product_ids: product_ids
    }, as: :json

    # Load the shopper record from the database to ensure
    # the products have been persisted.
    shopper = Shopper.find(shopper.id.to_s)

    # There should be two products in our cart
    assert_equal 2, shopper.basket.items.count
  end

  test "update an existing user's basket" do
    # Ensure we have a shopper who has a basket with products
    # already persisted in the database
    existing_shopper = create(:shopper_with_items)

    # Find our existing shopper
    get shopper_url(existing_shopper.id), as: :json

    # Parse the JSON response
    shopper_json = JSON.parse(@response.body)
    shopper = Shopper.new(shopper_json)

    # Remove one of the existing products from our basket
    products = []
    products << shopper.basket.items.first.product
    # Create one new product which we'll add to our basket
    products << create(:product)

    # Conver the BSON::ObjectId instances to strings
    product_ids = products.map{|p| p.id.to_s}

    # Update the basket
    put shopper_basket_url(shopper.id.to_s), params: {
      product_ids: product_ids
    }, as: :json

    # Load the shopper record from the database to ensure
    # the products have been persisted
    shopper = Shopper.find(shopper.id.to_s)

    # The products in the basket should match what we supplied
    items = shopper.basket.items
    assert_equal product_ids[0], items[0].product.id.to_s
    assert_equal product_ids[1], items[1].product.id.to_s
  end

  test "clear an existing user's basket" do
    # Ensure we have a shopper who has a basket with products
    # already persisted in the database
    existing_shopper = create(:shopper, basket: build(:basket_with_items))

    delete shopper_basket_url(existing_shopper.id), as: :json

    # Load the shopper record from the database to ensure
    # the products have been persisted.
    shopper = Shopper.find(existing_shopper.id)

    assert_empty shopper.basket.items
  end

end
