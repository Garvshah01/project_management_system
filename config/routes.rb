Rails.application.routes.draw do

  resources :tasks
  resources :users
  root 'homepage#index'
end
