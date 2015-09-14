Rails.application.routes.draw do
  resources :documents
  resources :keywords, only: [:index, :show]

  root to: 'visitors#index'
end
