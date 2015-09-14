Rails.application.routes.draw do
  resources :documents

  root to: 'visitors#index'
end
