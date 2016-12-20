Rails.application.routes.draw do
  
  resources :volunteers_groups
  root 'users#index'

  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'

  resources :users do
    resources :locations, only: [:new, :create, :edit, :update]
  end
  
  resources :volunteers do
    resources :locations, only: [:new, :create, :edit, :update]
  end

  resource :sessions, only: [:new, :create, :destroy]

  resources :clients do
    resources :locations, only: [:new, :create, :edit, :update]
  end

end
