Rails.application.routes.draw do
  root to: "products#index"
  resources :products, only: [:index, :new, :create, :show, :edit, :update]

  devise_for :users
end
