Rails.application.routes.draw do

  # mount Plutus::Engine => "/plutus", :as => "plutus"
  resource :sessions, only: [:new, :create, :destroy]

  root 'front#new'

  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  get '/front' => "front#new"
  get '/dashboard' => 'dashboard#index'


  resources :users, except: [:show]
  resources :volunteers 
  resources :volunteers_imports, only: [:new, :create]
  get 'volunteers_imports', to: 'volunteers_imports#new' 
  resources :clients, path: "dogs_owners"
  resources :dogs_owners_imports, only: [:new, :create]
  resources :stats, only: [:index] do
    collection do
      get :accounts
      get :volunteers
      get :clients
      get :donations
    end
  end
  namespace :business do
    resources :donations
    resources :donations_imports, only: [:new, :create]
    resources :donators, only: [:index, :show]
    resources :donators_imports, only: [:new, :create]
    resources :general_ledger, only: [:index]
    resources :accounts do
      collection do
        get :assets
        get :liabilities
        get :expenses
        get :revenues
        get :equities
      end
    end
    resources :entries
  end
  resources :volunteers_groups
  resources :events do
    collection do
      post :transfer
    end
  end
  resources :dogs, except: [:new, :create]
  resources :dogs_imports, only: [:new, :create]
  resources :settings
  resources :front
  # get 'front/create'
end
