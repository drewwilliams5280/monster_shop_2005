Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    get '/', to: 'dashboard#index'
    get '/merchants', to: 'merchants#index'
    get '/merchants/:id', to: 'merchants#show'
    patch '/merchants/:id', to: 'merchants#update'
    # resources :merchants, only: [:index, :show, :update]
    get 'users/', to: 'users#index'
    get 'users/:id', to: 'users#show'
    # resources :users, only: [:index, :show]
    get '/users/:id/orders', to: 'orders#index'
    get '/users/:user_id/orders/:order_id', to: 'orders#show'
  end

  namespace :merchant do
    get '/', to: "dashboard#index"
    get '/items', to: 'items#index'
    get '/items/:id', to: 'items#show'
    get '/items/new', to: 'items#new'
    post '/items', to: 'items#create'
    # resources :items, only: [:index, :show, :create, :new]
    get '/discounts', to: 'discounts#index'
    post '/discounts', to: 'discounts#create'
    get '/discounts/new', to: 'discounts#new'
    get '/discounts/:id/edit', to: 'discounts#edit'
    patch '/discounts/:id', to: 'discounts#update'
    get '/discounts/:id', to: 'discounts#show'
    delete '/discounts/:id', to: 'discounts#destroy'
    # resources :discounts
    resources :bulk_discounts, only: [:new, :create]
    # get '/bulk_discounts/new', to: 'bulk_discounts#new'
    # post '/bulk_discounts', to: 'bulk_discounts#create'
    post '/items/new', to: "/merchant/items#new"
    get '/orders/:id', to: 'orders#show'
    put '/orders/:id', to: 'orders#update'
    patch '/orders/:id', to: 'orders#update'
    # resources :orders, only: [:show, :update]
    patch "/orders/:order_id/items/:item_id/update", to: "orders#update"
    patch "/items/:id", to: "items#update_activation"
    delete "/items/:id", to: "items#destroy"
    get "/items/:item_id/edit", to: "items#edit"
    patch "/items/:item_id/edit", to: "items#update"
  end

  resources :merchants
  # get "/merchants", to: "merchants#index"
  # get "/merchants/new", to: "merchants#new"
  # get "/merchants/:id", to: "merchants#show"
  # post "/merchants", to: "merchants#create"
  # get "/merchants/:id/edit", to: "merchants#edit"
  # patch "/merchants/:id", to: "merchants#update"
  # delete "/merchants/:id", to: "merchants#destroy"

  resources :items
  # get "/items", to: "items#index"
  # get "/items/:id", to: "items#show"
  # get "/items/:id/edit", to: "items#edit"
  # patch "/items/:id", to: "items#update"
  # delete "/items/:id", to: "items#destroy"
  get "/merchants/:merchant_id/items", to: "items#index"
  get "/merchants/:merchant_id/items/new", to: "items#new"
  post "/merchants/:merchant_id/items", to: "items#create"

  get "/items/:item_id/reviews/new", to: "reviews#new"
  post "/items/:item_id/reviews", to: "reviews#create"

  resources :reviews, only: [:edit, :update, :destroy]
  # get "/reviews/:id/edit", to: "reviews#edit"
  # patch "/reviews/:id", to: "reviews#update"
  # delete "/reviews/:id", to: "reviews#destroy"

  post "/cart/:item_id", to: "cart#add_item"
  get "/cart", to: "cart#show"
  patch "/cart/:modify/:item_id", to: "cart#update"
  delete "/cart", to: "cart#empty"
  delete "/cart/:item_id", to: "cart#destroy"

  resources :orders, only: [:new, :create, :show]
  # get "/orders/new", to: "orders#new"
  # post "/orders", to: "orders#create"
  # get "/orders/:id", to: "orders#show"
  put "/orders/:id", to: "orders#ship"

  get "/register", to: "users#new"
  post "/register", to: "users#create"

  get "/profile", to: "users#show"
  get "/profile/edit", to: 'users#edit'
  get "/profile/password", to: 'users#edit_password'
  patch '/profile', to: 'users#update'
  put '/profile', to: 'users#update_password'
  get "/profile/orders", to: "orders#index"
  patch "/profile/orders/:order_id", to: "orders#update"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/", to: "home#index"
end
