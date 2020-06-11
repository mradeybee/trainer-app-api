Rails.application.routes.draw do
  namespace :v2 do
    post "/graphql", to: "graphql#execute"
  end

  resources :users
  resources :email_confirmation, only: :update

  post '/auth/login', to: 'auth#login', as: 'login'
  post '/auth/logout', to: 'auth#logout', as: 'logout'
  post '/auth/refresh', to: 'auth#refresh_token', as: 'refresh_token'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  if Rails.env.development? || Rails.env.staging?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/v2/graphql"
  end
end
