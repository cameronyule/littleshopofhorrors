class ShoppersController < ApplicationController
  before_action :set_shopper, only: [:show, :update, :destroy]

  # GET /shoppers/1
  def show
    render json: @shopper
  end

  # POST /shoppers
  def create
    @shopper = Shopper.new(shopper_params)

    if @shopper.save
      render json: @shopper, status: :created, location: @shopper
    else
      render json: @shopper.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shoppers/1
  def update
    if @shopper.update(shopper_params)
      render json: @shopper
    else
      render json: @shopper.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shoppers/1
  def destroy
    @shopper.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopper
      @shopper = Shopper.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shopper_params
      params.require(:shopper).permit(:name, :email)
    end
end
