Rails.application.routes.draw do
  get 'products/index'
  root to: "products#index"
  resources :products, only: [:index, :new, :create]

  devise_for :users
end
