Rails.application.routes.draw do
  get 'customers/index'
  devise_for :users

  resources :tables, only: [:index, :show, :edit,:update] do
    resources :orders, only: [:index, :create, :destroy]
    resources :customers, only: [:create]

    post "create_order", to: "orders#create_order"
    delete "delete_order", to: "orders#delete_order"

    patch "decrement_pax", to: "tables#decrement_pax"
    patch "increment_pax", to: "tables#increment_pax"
  end

  resources :dishes, only: [:index, :create, :destroy]

  resources :kitchens, only: [:index]

  root to: 'tables#index'
  # root to: 'pages#home'
end
