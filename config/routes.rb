Rails.application.routes.draw do
  root to: 'pages#home'

  get 'get_dataset', to: 'pages#get_dataset'
end
