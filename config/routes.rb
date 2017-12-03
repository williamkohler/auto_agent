Rails.application.routes.draw do

  root 'static_pages#home'
  get 'artist_relationships/create'
  get 'artist_relationships/destroy'
  get 'artists/index'
  get 'password_resets/edit'
  get 'password_resets/new'
  get 'sessions/new'
  get 'shows/new'
  get 'shows/import'
  get 'users/new'
  get '/about',       to: 'static_pages#about'
  get '/contact',     to: 'static_pages#contact'
  get '/help',        to: 'static_pages#help'
  get '/test',        to: 'static_pages#test'
  get '/login',       to: 'sessions#new'
  get '/signup',      to: 'users#new'
  post '/login',      to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :agents,              only: [:create, :destroy, :index]
  resources :artists
  resources :microposts,          only: [:create, :destroy]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :relationships,       only: [:create, :destroy]
  resources :shows,               only: [:new, :create, :index] do
    collection { post :import }
  end
end
