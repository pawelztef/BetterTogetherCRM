Rails.application.routes.draw do

  resource :sessions, only: [:new, :create, :destroy]

  root 'users#index'

  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'


  resources :users 
  resources :volunteers 
  resources :volunteer_imports
  resources :clients, path: "dogowners"

  namespace :business do
    resources :donations
    resources :donators, only: [:index, :show]
  end
  
  get '/dashboard' => 'dashboard#index'
  resources :volunteers_groups
  resources :events do
    collection do
      post :transfer
    end
  end
  resources :dogs, except: [:new, :create]
  resources :dog_imports

end
