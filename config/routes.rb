Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  root to: 'pages#home'

  resources :companies, only: %i[show new create] do
    resources :contracts, only: %i[new create]
  end

  resources :users, only: %i[show]

  resources :individuals, only: %i[show new create edit update]

  resources :contracts, only: %i[index show] do
    resources :companies, only: %i[index]
  end
end
