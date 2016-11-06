class BasketsController < ApplicationController
  before_action :set_shopper, only: [:show, :update, :destroy]

  # GET /api/shoppers/:id/basket
  def show
    render json: @shopper.basket
  end

  # PATCH/PUT /api/shoppers/:id/basket
  def update
    begin
      @shopper.basket.update_items(params[:product_ids])
      render json: @shopper.basket
    rescue Mongoid::Errors::DocumentNotFound
      render json: {errors: "One or more product IDs were not recognised"},
        status: :unprocessable_entity
    end
  end

  # DELETE /api/shoppers/:id/basket
  def destroy
    @shopper.basket.empty_items
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopper
      @shopper = Shopper.find(params[:shopper_id])
    end

end
