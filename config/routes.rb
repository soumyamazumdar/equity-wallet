Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      resources :users do
        resources :transactions
        resources :stocks
      end

      resources :companies do
        resources :stocks
      end

      resources :stocks
      resources :transactions
      
    end
  end

  get 'sessions/new'
   
  get 'welcome/index'

  # resources :sessions

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'sessions/create'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'stocks/update_stocks_available'
  get 'stocks/user_specific_stocks'
  get 'transactions/view_user_transaction'
  get 'transactions/companywise_stocks_bought'
  get 'transactions/stockwise_total_transaction'
  get 'transactions/total_purchase_sale'
  get 'transactions/sell_stock'
  get 'transactions/update_number_of_stock'
  get 'transactions/success'
  get 'companies/show_updated_company'
  get 'users/admin_dashboard'
  get 'users/make_admin'
  get 'users/contact_us'
  get 'users/about_us'
  get 'users/help'

  resources :users do
    resources :transactions
    resources :stocks
  end

  resources :companies do
  	resources :stocks
  end

  resources :stocks
  resources :transactions

  #root 'welcome#index'
  root 'sessions#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
