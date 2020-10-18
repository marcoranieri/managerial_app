Rails.application.routes.draw do
  devise_for :users

  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :tables, only: [ :index, :show, :new, :edit, :update ] do
    resources :orders, only: [ :index, :create, :destroy ]
    resources :customers, only: [ :create ]

    post "create_order",   to: "orders#create_order"
    delete "delete_order", to: "orders#delete_order"

    patch "decrement_pax", to: "tables#decrement_pax"
    patch "increment_pax", to: "tables#increment_pax"
  end

  resources :dishes, only: [ :index, :create, :edit, :update, :destroy ]

  resources :kitchens, only: [ :index ]

  root to: 'tables#index'
end
