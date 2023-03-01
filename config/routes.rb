# frozen_string_literal: true

Rails.application.routes.draw do
  get 'categorize/index'
  get 'categorize/deck'

  resources :binance_import_lines, except: %i[new create]
  post 'binance_import_lines/import'

  resources :ecobank_import_lines, except: %i[new create]
  post 'ecobank_import_lines/import'

  resources :momo_import_lines, except: %i[new create]
  post 'momo_import_lines/import'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'internet/index'
  resources :internet_balances, except: :index
  resources :internet_purchases, except: :index
  resources :internet_accounts

  get 'electricity/index'
  resources :electricity_balances, except: :index
  resources :electricity_purchases, except: :index
  resources :electricity_meters
  get 'electricity/usage_chart'

  resources :tags
  resources :items
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'
end
