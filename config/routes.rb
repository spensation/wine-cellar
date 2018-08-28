Rails.application.routes.draw do
  root 'bottles#index'

  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'seesions#create'
  delete  '/logout',  to: 'sessions#destroy'
  
  resources :countries, only: [:show] do 
  	resources :appellations, only: [:show, :index]
  end

  resources :appellations, only: [:index, :show, :new, :create, :edit, :update]

  resources :countries, only: [:show] do 
  	resources :producers, only: [:show, :index]
  end

  resources :producers, only: [:index, :show, :new, :create, :edit, :update]

  
 
  resources :users, only: [:show] do 
  	resources :bottles, only: [:show, :index]
  end

  resources :bottles, only: [:index, :show, :new, :create, :edit, :update]

  resources :varietals

 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
