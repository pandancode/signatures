Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  root to: 'pages#home'

  resources :companies, only: %i[show new create edit update]

  resources :individuals, only: %i[show new create edit update]

  resources :contracts, only: %i[index show new create]
end
