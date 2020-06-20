class Customer::OrdersController < ApplicationController
  def index
    @orders = Order.where(end_user: current_end_user)
  end

  def new
    @order = Order.new
    @deliveries = Delivery.where(end_user: current_end_user)
  end

  def confirm
    @tax = 1.1
    @postage = 800
    @total_price = 0

    @order = Order.new
    @cart_items = CartItem.where(end_user: current_end_user)
    @pay_type = order_params[:pay_type]
    # カート内に商品はありますか?
    if current_end_user.cart_items.exists?
      if order_params[:address_type] == "1"
        @postcode = current_end_user.postcode
        @address = current_end_user.address
        @direction = current_end_user.first_name + current_end_user.last_name
      elsif order_params[:address_type] == "2"
        # findでdelivery_idの情報を全部取得
        delivery = Delivery.find(order_params[:delivery_id])
        @postcode = delivery.postcode
        @address = delivery.address
        @direction = delivery.direction
      else
        @postcode = order_params[:postcode]
        @address = order_params[:address]
        @direction = order_params[:direction]
        # 宛先新規登録
        # hidden_fieldが2つに対応していると考える
        delivery = current_end_user.deliveries.new(add_deli_params)
        delivery.save
      end
    else
      redirect_to items_path, notice: "カートに商品が入っていません。"
    end
  end

  def create
    order = Order.new(order_params)
    order.end_user = current_end_user
    if order.save
      # 履歴詳細item情報の登録 (cart_item == order_detail)
      current_end_user.cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.order_id = order.id
        order_detail.item_id = cart_item.item_id
        order_detail.quantity = cart_item.quantity
        order_detail.price = cart_item.item.non_tax_price
        order_detail.save
      end
      current_end_user.cart_items.destroy_all
      redirect_to thanks_orders_path
    else
      @order = Order.new
      @deliveries = Delivery.where(end_user: current_end_user)
      render :new
    end
  end

  def thanks
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:pay_type,
                                  :address_type,
                                  :delivery_id,
                                  :postcode,
                                  :address,
                                  :direction,
                                  :tax,
                                  :postage,
                                  :total_price,
                                  :order_status
                                  )
  end

  def add_deli_params
    params.require(:order).permit(:postcode, :address, :direction)
  end

  # def add_direction_param
  #   params.require(:order).permit(:add_direction)
  # end
  # end_user_id==delivery_id
end
