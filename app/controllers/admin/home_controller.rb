class Admin::HomeController < ApplicationController
	before_action :authenticate_admin_admin!
  def top
  	@orders = Order.all
  end
end
