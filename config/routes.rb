Rails.application.routes.draw do
  root "customer/products#top"
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
    resources :tests, only: [:new]
  end

  scope module: :customer do
    resources :products
    get "products/about" => "products#about"
  end
end
