Rails.application.routes.draw do
  root to: "products#index"
  resources :products

  resources :products do
    resources :orders, only: [:index, :create]
  end

  devise_for :users
end
