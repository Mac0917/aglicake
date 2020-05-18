Rails.application.routes.draw do
  
  devise_for :members
  namespace :admins do   
    resources :members, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
  end
  patch "members/status/edit" => "members#status_update", as: "member_status_edit"
  get 'members/status' 
  resources :members, only: [:show, :edit, :update] 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html




end
