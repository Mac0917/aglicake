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
    resources :genres, only: [:new, :create, :index, :edit, :update, :destroy]
    resources :order_items, only: [:update]
  end
  
  get 'members/status'
  patch "members/status/edit" => "members#status_update", as: "member_status_edit"
  resources :members, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :shipping_addresses
  resources :items, only: [:index, :show, ] do
    get :search, on: :collection
  end
  delete 'carts/destroy_all'
  resources :carts, only: [:new, :create, :index, :edit, :update, :destroy]
  get 'orders/thanks'
  resources :orders, only: [:new, :create, :update ,:index, :show]
  post 'orders/purchase'
  root "home#top"
  get "admins/top" => "admins/admins#top", as: "admins_top"
end
