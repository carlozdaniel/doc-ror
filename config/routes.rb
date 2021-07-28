Rails.application.routes.draw do
  #active admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # photos controller
  get 'photos/:id', to: 'photos#show', as: "photo_detail"
  #welcome controller
  get 'welcome/index', to: 'welcome#index', as: 'welcome_home'

  root to: 'welcome#index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
