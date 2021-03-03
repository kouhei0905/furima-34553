Rails.application.routes.draw do
  root to: "products#index"
  resources :products, only: [:index, :new, :create, :show, :edit]

  devise_for :users
end
