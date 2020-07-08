class Customer::CartItemsController < ApplicationController
  before_action :authenticate_end_user!
	before_action :set_cart_item, only: [:update, :destroy]
  def index
  	@cart_items = CartItem.where(end_user: current_end_user)
  	@tax = 1.1
  	@total_price = 0
  end

  def create
  	cart_item = CartItem.new(cart_item_params)
  	cart_item.end_user_id = current_end_user.id
    # include_brank == 個数選択ならば
    if cart_item.quantity == nil
      redirect_back(fallback_location: root_path, notice: "個数を選択してください。")
      return
    end

    # カート内に同商品があれば
  	if current_end_user.cart_items.where(item_id: cart_item.item_id).exists?
  		redirect_to cart_items_path, notice: "カート内から商品を追加してください。"
  	else
  		cart_item.save
  		redirect_to cart_items_path, notice: "商品を追加しました。"
  	end
  end

  def update
  	@cart_item.update(cart_item_params)
  	redirect_back(fallback_location: root_path)
  end

  def destroy
  	@cart_item.destroy
  	redirect_back(fallback_location: root_path)
  end

  def empty
  	current_end_user.cart_items.destroy_all
  	redirect_back(fallback_location: root_path)
  end

  private

  def cart_item_params
  	params.require(:cart_item).permit(:item_id, :quantity)
  end

  def set_cart_item
  	@cart_item = CartItem.find(params[:id])
  end
end
