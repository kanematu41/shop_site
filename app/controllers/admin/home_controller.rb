class Admin::HomeController < ApplicationController
  def top
  	@orders = Order.all
  end
end
