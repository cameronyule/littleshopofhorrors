class CheckoutController < ApplicationController
  before_action :set_shopper, only: [:checkout]
  before_action :check_basket, only: [:checkout]

  # POST /api/shoppers/:id/checkout
  def checkout
    order = @shopper.orders.create
    order.populate_from_basket(@shopper.basket)

    if order.save
      @shopper.basket.empty_items
      render json: order, status: :created
    else
      render json: {errors: order.errors}, status: :unprocessable_entity
    end
  end

  private

    def set_shopper
      @shopper = Shopper.find(params[:shopper_id])
    end

    def check_basket
      if @shopper.basket.items.empty?
        render json: {errors: "Basket is empty"}, status: :unprocessable_entity
      end
    end

end
