Rails.application.routes.draw do
  resources :loans
  resources :expenses
  resources :incomes
  resources :accounts
  resources :transactions
  resources :payments
  resources :subs
  get 'pages/home'
  get 'pages/dashboard'

  resources :credit_cards
  resources :users, only: [:show]
  devise_for 	:users,
              :path => '',
              :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'}

  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end