Rails.application.routes.draw do
  get 'transactions/show'
  get 'transactions/new'
  get 'transactions/create'
  resources :overdrafts, only: :show
  resources :accounts
  resources :users
  root to: 'welcome#index'
  get 'welcome/index'

  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
