Rails.application.routes.draw do
  root to: 'pages#home'

  get 'get_dataset', to: 'pages#get_dataset'
  get 'get_processed_dataset', to: 'pages#get_processed_dataset'
end
