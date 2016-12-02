Rails.application.routes.draw do
  
  root 'users#index'

  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'

  resources :users
  resources :volunteers
  resource :sessions, only: [:new, :create, :destroy]

end
