Rails.application.routes.draw do

  get 'movies/index'

  get 'movies/create'

  get 'movies/destroy'

  get 'movies/edit'

  get 'movies/update'

  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
