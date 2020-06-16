class Admin::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  	# end_user = EndUser.find(params[:end_user_id])
  	# @full_name = end_user.first_name + end_user.last_name
  end

  def show
  	@order = Order.find(params[:id])
  end

  def update
  end
end
