Rails.application.routes.draw do
  root 'notes#index'
  resources :notes
  get '/auth/:provider/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
