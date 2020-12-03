Rails.application.routes.draw do

  devise_for :customers, controllers:{
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
  }
  devise_for :admins
  namespace :admin do
    get "products/top" => "products#top"
    resources :customers
    resources :products
    resources :genres, only: [:index, :create, :edit, :update]

  end
  
  scope module: :customer do
    resources :products
    get "products/about" => "products#about"
    resources :customers, only: [:show, :create, :edit, :update] do
      member do
        get "quit"
        patch "withdraw"
      end
    end
    resources :ship_cities,only: [:index,:create,:edit,:update,:destroy]
  end
end
