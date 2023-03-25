Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#welcome"
  post '/users', to: "users#create"
  post '/users/login', to: "sessions#login"

  mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
  post 'google_auth/callback', to "google_auth#authenticate_social_auth_user"

end
