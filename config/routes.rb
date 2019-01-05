Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :update] do
    resources :movies, only: [:new, :create, :edit, :update, :delete]
  end
  resources :movies, only: [:show, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
