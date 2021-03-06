Rails.application.routes.draw do
 
 
  devise_for :customers, :path_names => {:edit => "edit2"}
  devise_for :admins,path: "admin"
 namespace :admin do
  root to: "homes#top"
  resources :genres, only:[:index, :create, :edit, :update]
  resources :items, only:[:new, :create, :index, :show, :edit, :update]
  resources :customers, only:[:index, :show, :edit, :update]
  resources :orders, only:[:show]
 end
 
 scope module: :public do
  root to: "homes#top"
  root to: "orders#index"
  root to: "addresses#index"
  get "/about" => "homes#about"
  resources :items, only:[:index, :show]
  resources :cart_items, only:[:index, :update, :destroy, :create]
  delete "cart_items" => "cart_items#destroy_all", as: "destroy_all_cart_items"
  resources :orders, only:[:new, :index, :create]
  post "orders/confirm" => "orders#confirm", as: "confirm_orders"
  get "orders/complete" => "orders#complete", as: "complete_orders"
  get "orders/:id" => "orders#show", as: "order"
  
  resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  get "customers" => "customers#show"
  get "customers/edit" => "customers#edit", as: "edit_customer"
  get "customers/unsubscribe" => "customers#unsubscribe"
  patch "customers/withdrawal" => "customers#withdrawal", as: "withdrawal_customer"
 end
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
