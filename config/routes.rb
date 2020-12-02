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
    resources :customers
  end
end
