Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get 'contracts/company', to: 'contracts#company', as: contract_company
  # resources :users, only: :show do
    resources :companies, only: %i[show new create]
  # end
  
  resources :contracts, only: %i[index new create show] do
    resources :signatories, only: %i[new create]
  end
  resources :signatories, only: %i[edit update show]
end
