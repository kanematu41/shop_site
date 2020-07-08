class Customer::ItemsController < ApplicationController
	before_action :set_item, only: [:show, :baria_item]
	before_action :baria_item, only: [:show]
  def index
  	@items = Item.where(is_valid: false)
  end

  def show
  	@tax = 1.1
  	@cart_item = CartItem.new
  end

  private
  def set_item
  	@item = Item.find(params[:id])
  end

  def baria_item
  	if @item.is_valid == "販売停止中"
  		redirect_to items_path, notice: "無効です"
  	end
  end
end
