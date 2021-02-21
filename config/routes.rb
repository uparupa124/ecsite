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
  root to: "homes#top"
  root to: "orders#index"
  root to: "addresses#index"
  get "/about" => "homes#about"
  resources :items, only:[:index, :show]
  resources :cart_items, only:[:index, :update, :destroy, :create]
  delete "cart_items" => "cart_items#destroy_all", as: "destroy_all_cart_items"
  resources :orders, only:[:new, :index, :show]
  post "orders/confirm" => "orders#confirm"
  resources :addresses, only:[:index, :edit, :create, :update, :destroy]
 end
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
