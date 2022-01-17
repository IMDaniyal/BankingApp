Rails.application.routes.draw do
  resources :transactions, except: [:destroy, :new]
  get 'transactions/new/:id' => "transactions#new", as: "new_transaction"
  get 'transactions/bankstatement/:account_id' => "transactions#bank_statement", as: "bank_statement"
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
