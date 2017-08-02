Rails.application.routes.draw do

  devise_for :users
resources :movies

resources :books

root 'books#index'
end
