Rails.application.routes.draw do
  devise_for :users
  #active admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # photos controller
  get 'photos/my_photos', to: 'photos#my_photos',  as: 'my_photos'
  resources :photos


  #welcome controller
  get 'welcome/index',    to: 'welcome#index',     as: 'welcome_home'

  #api

  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit]
    end
  end
  root to: 'welcome#index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
