Rails.application.routes.draw do

  resource :sessions, only: [:new, :create, :destroy]

  root 'dashboard#index'

  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'


  resources :users 
  resources :volunteers 
  resources :volunteers_imports
  resources :clients, path: "dogs_owners"
  resources :dogs_owners_imports

  namespace :business do
    resources :donations
    resources :donations_imports
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
  resources :dogs_imports

end
