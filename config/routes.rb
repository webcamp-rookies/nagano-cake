Rails.application.routes.draw do

  devise_for :customers
  devise_for :admins
  namespace :admin do

    get "products/top" => "products#top"
    resources :customers
    resources :products
    resources :genres, only: [:index, :create, :edit, :update]

  end

  scope module: :customer do

    root 'products#top'
    get "about" => "products#about"
    delete 'cart_products/destroy_all' => 'cart_products#destroy_all'

    resources :products

    get "products/about" => "products#about"
    resources :customers, only: [:show, :create, :edit, :update] do
      member do
        get "quit"
        patch "withdraw"
      end
    end
    resources :ship_cities,only: [:index,:create,:edit,:update,:destroy]
    resources :cart_products, only:[:create, :index, :update, :destroy]

  end
end
