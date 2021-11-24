Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  root to: 'pages#home'

  resources :users, only: [:show]
  resources :companies, only: %i[show new create]
  resources :individuals, only: %i[show new create edit update]

  resources :contracts, only: %i[index show new create] do
    resources :signatories, only: %i[new create]
    resources :companies, only: %i[index]
  end
  resources :signatories, only: %i[show edit update]
end
