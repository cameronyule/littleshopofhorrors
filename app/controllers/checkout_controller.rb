class CheckoutController < ApplicationController
  before_action :set_shopper, only: [:checkout]

  # POST /api/shoppers/:id/checkout
  def checkout

  end

  private

    def set_shopper
      @shopper = Shopper.find(params[:shopper_id])
    end

end
