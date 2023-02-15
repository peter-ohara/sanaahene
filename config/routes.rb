Rails.application.routes.draw do
  get 'internet/index'
  resources :internet_balances, except: :index
  resources :internet_purchases, except: :index
  resources :internet_accounts

  get 'electricity/index'
  resources :electricity_balances, except: :index
  resources :electricity_purchases, except: :index
  resources :electricity_meters

  resources :tags
  resources :items
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
