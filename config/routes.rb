Rails.application.routes.draw do

  get 'crear_plato/index'

  resources :platos, only: :index do
    resources :orders, only: :create
  end

  resources :orders, only: :index do
    collection do
      get 'clean'
    end
  end

  resources :billings, only: [] do
    collection do
      get 'pre_pay'
    end
  end
  
  root to: 'platos#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
