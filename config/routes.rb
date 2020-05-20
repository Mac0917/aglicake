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
  end
  patch "members/status/edit" => "members#status_update", as: "member_status_edit"
  get 'members/status' #membersのstatusアクションが実行される
  root "home#top"
  resources :members, only: [:show, :edit, :update] #memberの新たなurlはresoucesの上に書く
  resources :shipping_addresses
  get "admins/top" => "admins/members#top", as: "admins_top"
  
  resources :orders, only: [:new, :create, :index, :show, :edit, :update]
  get 'orders/thanks'
  get 'orders/purchase'
end
