Rails.application.routes.draw do

	namespace :admin do
		root to: 'home#top'
  	devise_for :admins, controllers: {
  		registrations: 'admin/admins/registrations',
  		sessions: 'admin/admins/sessions'
  	}
  	resources :end_users, only: [:index, :show, :update]
  	resources :items, only: [:index, :new, :create, :show, :edit, :update]
  	resources :genres, only: [:index, :create, :edit, :update]
  	resources :orders, only: [:index, :show, :update]
  	resources :order_details, only: [:update]
  end

  scope module: :customer do
  	root to: 'home#top'
  	devise_for :end_users, controllers: {
  		registrations: 'customer/end_users/registrations',
  		sessions: 'customer/end_users/sessions',
  		passwords: 'customer/end_users/passwords'
  	}
  	resources :end_users, only: [:show, :edit, :update] do
      member do
        get :confirm
      end
    end
  	resources :items, only: [:index, :show]
    # delete 'cart_items/empty' => 'cart_items#empty', as: :empty
  	resources :cart_items, only: [:index, :create, :destroy, :update] do
      collection do
        delete :empty
      end
    end
  	resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
  	resources :orders, only: [:index, :new, :create, :show] do
      collection do
        post :confirm
      end
    end
  end

end
