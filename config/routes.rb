Rails.application.routes.draw do
  
  devise_for :users, :controllers => {:registrations => "registrations"}

  root to: 'static_pages#new', as: 'home'
  resources :static_pages, only: [:index], path: :team, as: 'team'

  resources :connections
  resources :suggestions
  resources :events
  resources :users
  resources :cities
  resources :sports
  resources :sport_users

  resources :climbing_performances, only: [:create]
  resources :running_performances, only: [:create]
  resources :workout_performances, only: [:create]
  resources :tennis_performances, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
