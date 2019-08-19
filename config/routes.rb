Rails.application.routes.draw do
  devise_for :users
  get 'users/top'
  get 'users/index'
  resources :users
  resources :books, only:[:new, :create, :index, :show]
end
