Rails.application.routes.draw do

	namespace :admin do
  	devise_for :admins, controllers: {
  		registrations: 'admin/admins/registrations',
  		sessions: 'admin/admins/sessions'
  	}
  end

  scope module: :customer do
  	devise_for :end_users, controllers: {
  		registrations: 'customer/end_users/registrations',
  		sessions: 'customer/end_users/sessions',
  		passwords: 'customer/end_users/passwords'
  	}
  end

end
