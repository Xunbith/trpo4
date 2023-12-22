Rails.application.routes.draw do
  get 'errors/not_authorized'
  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'
  resources :foods
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get 'errors/not_athorized'
  # Defines the root path route ("/")
  root 'home#index'
end
