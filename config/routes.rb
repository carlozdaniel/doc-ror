Rails.application.routes.draw do
  devise_for :users
  #active admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # photos controller
  get 'photo',            to: 'photos#index',      as: 'photos_index'
  get 'my_photos',        to: 'photos#my_photos',  as: 'my_photos'
  get 'photos/new',       to: 'photos#new',        as: 'photo_new'
  post 'photos',          to: 'photos#create',     as: 'photo_create'
  get 'photos/:id',       to: 'photos#show',       as: "photo_detail"
  get 'photos/:id/edit',  to: 'photos#edit',       as: "photo_edit"
  patch 'photos/:id',     to: 'photos#update',     as: "photo_update"


  #welcome controller
  get 'welcome/index',    to: 'welcome#index',     as: 'welcome_home'


  root to: 'welcome#index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
