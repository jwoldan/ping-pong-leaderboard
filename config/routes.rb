Rails.application.routes.draw do

  resources :games
  resources :games, only: [:new, :create]

  devise_for :users
  root to: "home#index"
  get '/history', to: 'home#history'
  get '/log',     to: 'games#new'
end
