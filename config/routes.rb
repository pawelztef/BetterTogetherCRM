Rails.application.routes.draw do
  resource :sessions, only: [:new, :create, :destroy]

  root 'users#index'

  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'

  resources :users do
    resources :locations, only: [:new, :create, :edit, :update]
  end
  
  resources :volunteers do
    resources :locations, only: [:new, :create, :edit, :update]
  end

  resources :clients do
    resources :locations, only: [:new, :create, :edit, :update]
  end
  
  resources :volunteers_groups
  resources :dogs

end
