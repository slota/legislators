Rails.application.routes.draw do
  get "/", to: 'welcome#index'
  get "/auth/facebook", as: :login
  get "/auth/facebook/callback", to: "sessions#create"
  get '/logout', to: 'sessions#destroy'
  resources :welcome, only: [:index, :show]
  resources :legislators, only: [:index, :show]
  resources :presidents, only: [:index, :show]
end
