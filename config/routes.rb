Rails.application.routes.draw do

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

  get 'geocoder/findaddress'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :crear_plato, only: :index do
    member do
      post 'create', as: :nuevo
    end
  end
  #get 'crear_plato/index'

  get 'platos/landing'
  get 'orders/address'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'platos#landing'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
