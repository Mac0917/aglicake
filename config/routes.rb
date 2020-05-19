Rails.application.routes.draw do
  
  devise_for :members
  namespace :admins do   
    resources :members, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    patch 'admins/orders_items/:id' => 'admins#order_items#update', as: 'admins_order_items_edit'
  end
  patch "members/status/edit" => "members#status_update", as: "member_status_edit"
  get 'members/status' 
  resources :members, only: [:show, :edit, :update] 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




end
