Rails.application.routes.draw do    
  root "welcome#index"

  get '/register', to: 'users#new'
  get '/home', to:'welcome#home'
  resources :users, only: [:create]

  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#destroy'
  resources :sessions, only: [:create]
  
end
