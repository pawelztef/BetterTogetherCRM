Rails.application.routes.draw do

  namespace :plutus do
  get 'entries/index'
  end

  namespace :plutus do
  get 'entries/show'
  end

  namespace :plutus do
  get 'entries/new'
  end

  namespace :plutus do
  get 'entries/edit'
  end

  namespace :plutus do
  get 'entries/create'
  end

  namespace :plutus do
  get 'entries/update'
  end

  namespace :plutus do
  get 'entries/destroy'
  end

  get 'entries/index'

  get 'entries/show'

  get 'entries/new'

  get 'entries/edit'

  get 'entries/create'

  get 'entries/update'

  get 'entries/destroy'

  resource :sessions, only: [:new, :create, :destroy]

  root 'dashboard#index'

  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'


  resources :users 
  resources :volunteers 
  resources :volunteers_imports, only: [:new, :create]
  resources :clients, path: "dogs_owners"
  resources :dogs_owners_imports, only: [:new, :create]

  namespace :business do
    resources :donations
    resources :donations_imports, only: [:new, :create]
    resources :donators, only: [:index, :show]
    resources :donators_imports, only: [:new, :create]
    resources :accounts
  end
  
  get '/dashboard' => 'dashboard#index'
  resources :volunteers_groups
  resources :events do
    collection do
      post :transfer
    end
  end
  resources :dogs, except: [:new, :create]
  resources :dogs_imports, only: [:new, :create]

end
