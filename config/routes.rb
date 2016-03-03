Rails.application.routes.draw do
  get "/", to: 'welcome#index'
  get "/auth/google_oauth2", as: :login
  get "/auth/google_oauth2/callback", to: "sessions#create"
  get '/logout', to: 'sessions#destroy'
  resources :welcome, only: [:index, :show]
  resources :legislators, only: [:index, :show]
end
