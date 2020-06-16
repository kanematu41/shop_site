class Customer::ItemsController < ApplicationController
  def index
  	@items = Item.where(is_valid: false)
  end

  def show
  	@item = Item.find(params[:id])
  	@tax = 1.1
  	@cart_item = CartItem.new
  end
end
