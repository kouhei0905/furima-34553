Rails.application.routes.draw do
  get 'fyrimas/index'
  root to: "fyrimas#index"
  resources :fyrimas, only: [:index]

  devise_for :users
end
