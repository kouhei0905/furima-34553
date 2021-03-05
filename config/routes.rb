Rails.application.routes.draw do
  root to: "products#index"
  resources :products

  resources :products do
    resources :orders
  end

  devise_for :users
end
