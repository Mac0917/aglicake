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
    patch 'admins/orders_items/:id' => 'admins#order_items#update', as: 'admins_order_items_edit'
  end
  patch "members/status/edit" => "members#status_update", as: "member_status_edit"

  get 'members/status' 
  resources :members, only: [:show, :edit, :update] 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html






  root "home#top"

  resources :shipping_addresses
  get "admins/top" => "admins/members#top", as: "admins_top"


end
