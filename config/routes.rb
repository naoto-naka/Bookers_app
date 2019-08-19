Rails.application.routes.draw do
  devise_for :users
  root 'users#top'
  get 'users/index'
  resources :users
  resources :books, only:[:new, :create, :index, :show]
end
