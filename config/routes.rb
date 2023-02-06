Rails.application.routes.draw do
  get 'electricity/index', as: :electricity_entries
  resources :electricity_balances
  resources :electricity_purchases
  resources :inventory_entries
  resources :tags
  resources :items
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
