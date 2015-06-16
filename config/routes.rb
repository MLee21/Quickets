Rails.application.routes.draw do
  root "home#index"
  delete "/logout" => 'sessions#destroy'
  get "/auth/:provider/callback" => 'sessions#create'
  get "/dashboard" => 'dashboard#show'
end
