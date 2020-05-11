Rails.application.routes.draw do
 resources :users
 resources :email_confirmation, only: :update

  post '/auth/login', to: 'auth#login', as: 'login'
  post '/auth/logout', to: 'auth#logout', as: 'logout'
  post '/auth/refresh', to: 'auth#refresh_token', as: 'refresh_token'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
