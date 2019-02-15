Rails.application.routes.draw do
  root 'user#index'

  resources :users
  resources :questions

  get 'show' => 'users#show'
end
