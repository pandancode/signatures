Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "company/description", to: "users#company_description"
  get "individual/description", to: "users#individual_description"
  resources :contracts, only: %i[index new create show] do
    resources :signatories, only: %i[new create]
  end
  resources :signatories, only: %i[edit update show]
end
