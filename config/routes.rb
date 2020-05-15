Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :sessions, only: [:new, :create, :destroy]
  resources :events, only: [:new, :create, :show, :index]
end
