Rails.application.routes.draw do
  mount_character_instance 'admin'

  root 'home#index'
  resources :submissions, only: :create
end
