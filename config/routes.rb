Rails.application.routes.draw do

  get 'geocoder/findaddress'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'crear_plato/index'

  resources :platos, only: :index do
    resources :orders, only: :create
  end

  resources :orders

  resources :billings, only: [:index] do
    collection do
      get 'pre_pay'
      get 'execute'
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: 'platos#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
