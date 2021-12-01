Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  root to: 'pages#home'

  resources :companies, only: %i[show new create edit update]

  resources :individuals, only: %i[show new create edit update]

  resources :contracts, only: %i[show new create edit update] do
    member do
      patch :sign
    end

  end
  if Rails.env.development?
    resource :pdf_signatures, only: :show
    resource :pdf_initials, only: :show
  end

  get "signed", to: "contracts#signed"
  get "unsigned", to: "contracts#unsigned"
end
