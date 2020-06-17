class Customer::OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
    @deliveries = Delivery.where(end_user: current_end_user)
  end

  def confirm
  end

  def thanks
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:address_type)
  end
  # end_user_id
end
