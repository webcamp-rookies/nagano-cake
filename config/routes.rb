Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope  module: :customer do
    resources :ship_cities,only: [:index,:create,:edit,:update,:destroy]
  end
end