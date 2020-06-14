class Admin::ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def new
  	@item = Item.new
  end

  def show
  end

  def edit
  end

  private
  def item_params
  	params.require(:item).permit(:name, :detail, :image, :non_tax_price, :genre_id, :is_valid)
  end
end
