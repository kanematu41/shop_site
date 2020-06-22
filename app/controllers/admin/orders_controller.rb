class Admin::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update]
  def index
  	@orders = Order.all
  end

  def show
  end

  def update
    @order.update(order_params)
    if order_params[:order_status] == "入金待ち"
      @order.order_details.each do |order_detail|
        order_detail.item_status = "着手不可"
        order_detail.save
      end
    elsif order_params[:order_status] == "入金確認"
      @order.order_details.each do |order_detail|
        order_detail.item_status = "製作待ち"
        order_detail.save
      end
    elsif order_params[:order_status] == "製作中"
      @order.order_details.each do |order_detail|
        order_detail.item_status = "製作中"
        order_detail.save
      end
    else
      @order.order_details.each do |order_detail|
        order_detail.item_status = "製作完了"
        order_detail.save
      end
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
