Rails.application.routes.draw do
  get 'fyrimas/index'
  root to: "fyrimas#index"

  devise_for :users
end
