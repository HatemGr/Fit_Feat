Rails.application.routes.draw do

  resources :friends
  resources :suggestions
  resources :events
  devise_for :users
  resources :users
  resources :cities
  resources :sports
  resources :sport_users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
