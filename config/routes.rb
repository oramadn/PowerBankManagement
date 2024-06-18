Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :admins do
    resources :locations
  end

  root 'pages#home'
  get 'users', to: 'pages#users', as: 'users_page'
  get 'admins', to: 'pages#admins', as: 'admins_page'
end
