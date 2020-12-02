Rails.application.routes.draw do

  devise_for :customers, controllers:{
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
  }
  devise_for :admins, controllers: {
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  namespace :admin do

    get "products/top" => "products#top"
    resources :products
    resources :genres, only: [:index, :create, :edit, :update]

  end
  
  scope module: :customer do
    resources :products
    get "products/about" => "products#about"
  end
end
