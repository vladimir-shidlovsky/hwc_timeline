Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  root 'home#index'

  resources :posts
  resources :teams
  resources :games
  resources :events
  resources :post_images

  put '/user/favourite/*tag_ids' => 'user_favourites#create', as: :add_user_favourites
  delete '/user/favourite/*tag_ids' => 'user_favourites#delete', as: :remove_user_favourites
end
