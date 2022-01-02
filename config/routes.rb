Rails.application.routes.draw do
  root 'notes#index'
  resources :notes
  get '/auth/:provider/callback' => 'sessions#create'
end
