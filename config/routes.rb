Rails.application.routes.draw do
 
 
  devise_for :customers
  devise_for :admins,path: "admin"
 namespace :admin do
  root to: "homes#top"
  resources :genres, only:[:index, :create, :edit, :update]
  resources :items, only:[:new, :create, :index, :show, :edit, :update]
  resources :customers, only:[:index, :show, :edit, :update]
 end
 
 scope module: :public do
  resources :items, only:[:index, :show]
  resources :cart_items, only:[:index, :update, :destroy, :create]
 end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
