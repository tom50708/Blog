Rails.application.routes.draw do
  namespace :admin do
  	resources :posts
  end
  root 'posts#index'
  resources :posts
end
