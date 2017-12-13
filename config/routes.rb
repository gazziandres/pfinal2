Rails.application.routes.draw do

  get 'geocoder/findaddress'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'crear_plato/index'
  get 'platos/landing'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'platos#landing'

  resources :platos, only: :index do
    resources :orders, only: :create, as: :pedido
  end

  resources :orders, only: :index do
    collection do
      get 'clean'
    end
  end

  resources :billings, only: [:index] do
    collection do
      get 'pre_pay'
      get 'execute'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
