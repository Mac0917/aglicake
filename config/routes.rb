Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
namespace :admins do
resources :items, only: [:new, :create, :index, :show, :edit, :update]
resources :genres, onry: [:new, :create, :index, :edit, :update, :destroy]
end


end
