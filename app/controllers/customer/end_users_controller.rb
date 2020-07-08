class Customer::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
	before_action :set_end_user, only: [:show, :edit, :update]
  def show
  end

  def edit
  end

  def update
  	if @end_user.update(end_user_params)
  		redirect_to end_user_path(@end_user)
  	else
  		render :edit
  	end
  end

  def confirm
  end

  private

  def end_user_params
  	params.require(:end_user).permit(:first_name,
  																	 :last_name,
  																	 :first_kana_name,
  																	 :last_kana_name,
  																	 :email,
  																	 :postcode,
  																	 :address,
  																	 :phone_number
  																		)
  end

  def set_end_user
  	@end_user = current_end_user
  end

end
