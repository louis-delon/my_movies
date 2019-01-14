Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :update] do
    resources :favorites, only: [:index]
    resources :movies, except: [:index] do
      resources :favorites, only: [:show, :create, :destroy]
    end
  end

  resources :movies, only: [:index, :show]

  get '/new_movies', to: 'movies#new_movies', as: :news
  get 'users/:id/own_movies', to: 'movies#own_movies', as: :own_movies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
