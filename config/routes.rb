Rails.application.routes.draw do

  devise_for :customers
  devise_for :admins
  namespace :admin do

    get "products/top" => "products#top"
    resources :customers
    resources :products
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only:[:update]

  end

  scope module: :customer do

    root 'products#top'
    delete 'cart_products/destroy_all' => 'cart_products#destroy_all'
    get "about" => "products#about"
    get 'orders/thanks' => "orders#thanks"
    post 'orders/confirm'

    resources :products

    get "products/about" => "products#about"
    resources :customers, only: [:show, :create, :edit, :update] do
      member do
        get "quit"
        patch "withdraw"
      end
    end
    resources :ship_cities,only: [:index,:create,:edit,:update,:destroy]
    resources :cart_products
    resources :orders,only: [:index, :new, :create, :show]


  end
end
