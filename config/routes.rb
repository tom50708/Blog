Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  namespace :admin do
  	resources :posts
  	root "posts#index"
  end
  root 'posts#index'
  resources :posts
  get 'about', to: 'posts#about'
end
