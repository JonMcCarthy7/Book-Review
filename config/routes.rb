Rails.application.routes.draw do

resources :movies

resources :books

root 'books#index'
end
