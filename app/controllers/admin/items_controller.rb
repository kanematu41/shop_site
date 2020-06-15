class Admin::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  def index
  	@items = Item.all
    @tax = 1.1
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)
  	if @item.save
  		redirect_to admin_item_path(@item)
  	else
  		render :new
  	end
  end

  def show
    @tax = 1.1
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to admin_items_path
    else
      render :edit
    end
  end

  private

  def item_params
  	params.require(:item).permit(:name, :detail, :image, :non_tax_price, :genre_id, :is_valid)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
