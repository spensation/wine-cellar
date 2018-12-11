Rails.application.routes.draw do
  root 'welcome#index'

  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  get     '/logout',  to: 'sessions#destroy'
  get     '/signup',  to: 'users#new'
  post    '/users',   to: 'users#create'
  
  resources :countries, only: [:show] do 
  	resources :appellations, only: [:show, :index]
  end

  resources :appellations, only: [:index, :show, :new, :create, :edit, :update]

  resources :countries, only: [:index, :show] do 
  	resources :producers, only: [:show, :index]
  end

  resources :producers, only: [:index, :show, :new, :create, :edit, :update]

  
 
  resources :users, only: [:index, :show, :new, :create] do 
  	resources :bottles, only: [:show, :index, :new, :create]
  end

  resources :varietals

 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
