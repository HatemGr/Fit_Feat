Rails.application.routes.draw do
  
  get 'notifications/index'
  get 'notifications/create'
  get 'notifications/update'
  get 'notifications/destroy'
  get 'participations/create'
  get 'participations/destroy'
  devise_for :users, :controllers => {:registrations => "registrations"}

  root to: 'static_pages#new', as: 'home'
  resources :static_pages, only: [:index], path: :team, as: 'team'

  
  resources :suggestions
  resources :events do
    resources :participations, only: [:create, :destroy]
    resources :images, only: [:create]
  end

  resources :users do
    resources :connections
    resources :avatars, only: [:create]
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
