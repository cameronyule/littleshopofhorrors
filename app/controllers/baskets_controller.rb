class BasketsController < ApplicationController
  before_action :set_shopper, only: [:show, :update, :destroy]

  # GET /basket
  def show
    render json: @shopper.basket
  end

  # PATCH/PUT /basket
  def update
    if @shopper.basket.update(basket_params)
      render json: @shopper.basket
    else
      render json: @shopper.basket.errors, status: :unprocessable_entity
    end
  end

  # DELETE /basket
  def destroy
    @shopper.basket.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopper
      @shopper = Shopper.find(params[:shopper_id])
    end

    # Only allow a trusted parameter "white list" through.
    def basket_params
      params.fetch(:basket, {})
    end
end
