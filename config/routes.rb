Rails.application.routes.draw do
  resources :events do
    resources :participations, only: %i[create destroy update]
    resources :images, only: [:create]
  end

  resources :messages
  resources :notifications, only: %i[index create destroy update]
  resources :participations, only: %i[create destroy]
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'static_pages#new', as: 'home'
  resources :static_pages, only: [:index, :create], path: :team, as: 'team'

  resources :suggestions

  resources :users do
    resources :connections
    resources :avatars, only: [:create]
  end

  namespace :admin do
    resources :users, only: %i[index destroy]
    resources :events, only: %i[index destroy]
    resources :cities, only: %i[index create destroy]
  end

  resources :cities
  resources :sports
  resources :sport_users

  resources :climbing_performances, only: [:create]
  resources :running_performances, only: [:create]
  resources :workout_performances, only: [:create]
  resources :tennis_performances, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
