Rails.application.routes.draw do
  mount_character_instance 'admin'

  root 'home#index'
  resources :webmaster_messages, only: :create
end
