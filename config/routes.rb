Rails.application.routes.draw do
  devise_for :users

  resources :tables, only: [:index, :show, :edit,:update] do
    resources :orders, only: [:index, :create]
    resources :customers, only: [:create]
  end

  resources :dishes, only: [:index, :create]

  resources :kitchens, only: [:index]

  root to: 'tables#index'
  # root to: 'pages#home'
end
