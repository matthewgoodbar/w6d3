Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:index, :show, :create, :update, :destroy]

  # get '/users', to: 'users#index', as: 'users'
  # get '/users/:id', to: 'users#show', as: 'user'
  # post '/users', to: 'users#create'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'

  resources :artworks, only: [:show, :create, :update, :destroy]

  resources :artwork_shares, only: [:create, :destroy]

  resources :users do
    resources :artworks, only: :index
    resources :comments, only: :index
  end

  resources :artworks do
    resources :comments, only: :index
  end

  resources :comments, only: [:index, :create, :destroy]

end
