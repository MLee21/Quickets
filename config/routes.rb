Rails.application.routes.draw do
  root "home#index"
  delete "/logout" => 'sessions#destroy'
  get "/auth/:provider/callback" => 'sessions#create'
  get "/dashboard" => 'dashboard#show'
  get "/tracked/artist" => 'tracked_artists#show'
  get "/events" => 'events#index'
end
