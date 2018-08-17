Rails.application.routes.draw do
  resources :varietals
  resources :appellations
  resources :countries
  resources :producers
  resources :users
  resources :bottles
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
