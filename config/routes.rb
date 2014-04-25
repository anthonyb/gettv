Rails.application.routes.draw do
  mount_character_instance 'admin'

  root 'home#index'
  resources :submission, only: :create
end
