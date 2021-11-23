Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  root to: 'contracts#company'
  get 'contracts/company', to: 'contracts#company', as: contract_company
  resources :contracts, only: %i[index new create show] do
    resources :signatories, only: %i[new create]
  end
  resources :signatories, only: %i[edit update show]
end
