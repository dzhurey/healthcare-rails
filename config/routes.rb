Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :doctors
    resources :hospitals

    root to: "users#index"
  end
  root to: "admin/users#index"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
