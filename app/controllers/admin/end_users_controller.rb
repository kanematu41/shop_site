class Admin::EndUsersController < ApplicationController
	before_action :authenticate_admin_admin!
  def index
  	@end_users = EndUser.all
  end

  def show
  	@end_user = EndUser.find(params[:id])
  end
end
