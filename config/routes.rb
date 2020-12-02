Rails.application.routes.draw do
  # root "customer/products#top"
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do

    get "products/top" => "products#top"
    resources :products
  end

  scope module: :customer do
    resources :products
    get "products/about" => "products#about"

  resources :genres, only: [:index, :create, :edit, :update]

  end
end
