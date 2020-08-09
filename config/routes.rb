Rails.application.routes.draw do
  get 'customers/index'
  devise_for :users

  resources :tables, only: [:index, :show, :edit,:update] do
    resources :orders, only: [:index, :create, :destroy]
    resources :customers, only: [:create]

    patch "decrement_pax", to: "tables#decrement_pax"
    patch "increment_pax", to: "tables#increment_pax"
  end

  resources :dishes, only: [:index, :create, :destroy]

  resources :kitchens, only: [:index]

  root to: 'tables#index'
  # root to: 'pages#home'
end
