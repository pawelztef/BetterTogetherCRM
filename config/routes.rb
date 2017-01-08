Rails.application.routes.draw do

  resource :sessions, only: [:new, :create, :destroy]

  root 'users#index'

  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'


  resources :users
  resources :volunteers
  resources :clients, path: "dogowners"

  namespace :business do
    resources :donations
    resources :donators, only: [:index, :show]
  end
  
  resources :volunteers_groups
  resources :dogs, except: [:new, :create]

end
