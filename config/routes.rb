Rails.application.routes.draw do
  get "/", to: 'welcome#index'
  get "/auth/google_oauth2", as: :login
  get "/auth/google_oauth2/callback", to: "sessions#create"
  resources :welcome, only: [:index, :show]
end
