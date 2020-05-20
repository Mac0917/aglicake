Rails.application.routes.draw do

  
  
  devise_for :members
  namespace :admins do   #ただの実験
    resources :members, only: [:index, :show, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :genres, onry: [:new, :create, :index, :edit, :update, :destroy]
  end
  patch "members/status/edit" => "members#status_update", as: "member_status_edit"
  get 'members/status' #membersのstatusアクションが実行される
  root "home#top"
  resources :members, only: [:show, :edit, :update] #memberの新たなurlはresoucesの上に書く
  resources :items, only: [:index, :show, ]
  resources :carts, onry: [:new, :create, :index, :edit, :update, :destroy] #
end
