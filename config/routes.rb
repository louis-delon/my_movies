Rails.application.routes.draw do

  get 'favorites/index'

  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :update] do
    # resources :movies, only: [:index]
  end
  resources :movies

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
