Rails.application.routes.draw do
  devise_for :users
  resources :doctors, only: %i[index show]
  resources :hospitals, only: %i[index show]
  get 'bookings/:id', to: 'bookings#new', as: :booking_new
  get 'bookings', to: 'bookings#index', as: :bookings
  post 'bookings/:id', to: 'bookings#create', as: :booking_create

  root to: 'doctors#index'

  namespace :admin do
    resources :users
    resources :doctors
    resources :hospitals
    resources :schedules
    resources :schedule_lines

    root to: 'users#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
