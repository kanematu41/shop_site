class Customer::OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
    @deliveries = Delivery.where(end_user: current_end_user)
  end

  def confirm
    @tax = 1.1
    @postage = 800
    @total_price = 0

    @cart_items = CartItem.where(end_user: current_end_user)
    @pay_type = order_params[:pay_type]
    if order_params[:address_type] == "1"
      @postcode = current_end_user.postcode
      @address = current_end_user.address
      @direction = current_end_user.first_name + current_end_user.last_name
    elsif order_params[:address_type] == "2"
      # findでdelivery_idの情報を全部取得
      @delivery = Delivery.find(order_params[:delivery_id])
      @postcode = @delivery.postcode
      @address = @delivery.address
      @direction = @delivery.direction
    else
      @postcode = order_params[:postcode]
      @address = order_params[:address]
      @direction = order_params[:direction]
    end
  end

  def thanks
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:pay_type,
                                  :address_type,
                                  :delivery_id,
                                  :postcode,
                                  :address,
                                  :direction
                                  )
  end
  # end_user_id
end
