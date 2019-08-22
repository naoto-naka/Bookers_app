Rails.application.routes.draw do
  get 'home/top'
  devise_for :users
  root 'users#top'
  get 'home/about'
  resources :users
  resources :books
end
