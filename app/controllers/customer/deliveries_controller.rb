class Customer::DeliveriesController < ApplicationController
	before_action :set_delivery, only: [:edit, :update, :destroy]
  def index
  	@delivery = Delivery.new
  	@deliveries = Delivery.where(end_user: current_end_user)
  end

  def create
  	@delivery = Delivery.new(delivery_params)
  	@delivery.end_user = current_end_user
  	if @delivery.save
  		redirect_back(fallback_location: root_path)
  	else
  		@deliveries = Delivery.where(end_user: current_end_user)
  		render :index
  	end
  end

  def edit
  end

  def update
  	if @delivery.update(delivery_params)
  		redirect_to deliveries_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@delivery.destroy
  	redirect_back(fallback_location: root_path)
  end

  private

  def delivery_params
  	params.require(:delivery).permit(:postcode, :address, :direction)
  end

  def set_delivery
  	@delivery = Delivery.find(params[:id])
  end
end
