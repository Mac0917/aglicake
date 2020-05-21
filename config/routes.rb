Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
    sessions:        "admins/sessions",  #admins/sessionsはコントローラー名
    passwords:       "admins/passwords",
    registrations:   "admins/registrations"
  }

  devise_for :members, controllers: {
    sessions:        "members/sessions",
    passwords:       "members/passwords",
    registrations:   "members/registrations"
  }
  
  namespace :admins do   
    resources :members, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, onry: [:new, :create, :index, :edit, :update, :destroy]
  end
  get 'members/status' 
  resources :members, only: [:show, :edit, :update] 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  patch 'admins/orders_items/:id' => 'admins#order_items#update', as: 'admins_order_items_edit'
  patch "members/status/edit" => "members#status_update", as: "member_status_edit"
  root "home#top"
  resources :shipping_addresses
  resources :items, only: [:index, :show, ]
  resources :carts, onry: [:new, :create, :index, :edit, :update, :destroy] #
  root "home#top"
  get "admins/top" => "admins/members#top", as: "admins_top"
end
