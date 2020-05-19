Rails.application.routes.draw do
  
  devise_for :members
  namespace :admins do   #ただの実験
    resources :members, only: [:index, :show, :edit, :update]
  end
  patch "members/status/edit" => "members#status_update", as: "member_status_edit"
  get 'members/status' #membersのstatusアクションが実行される
  root "home#top"
  resources :members, only: [:show, :edit, :update] #memberの新たなurlはresoucesの上に書く
  
end
