Rails.application.routes.draw do
  root "home#index"
  resources :sessions, only: :index
  get "/auth/:provider/callback" => 'sessions#create'
  get "/dashboard" => 'dashboard#show'
end
