Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
  end
  root "products#top"
  scope module: :customer do
    resources :products
    get "products/about" => "products#about"
  end
  devise_for :customers
end
