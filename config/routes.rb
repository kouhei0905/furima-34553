Rails.application.routes.draw do
  get 'fyrimas/index'
  root to: "fyrimas#index"
  resources :fyrimas, only: [:index, :new, :create]

  devise_for :users
end
