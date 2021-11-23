Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :individuals, only: %i[new create show update] do
    resources :signatories, only: %i[show edit update]
  end
  resources :contracts, only: %i[index new create show] do
    resources :signatories, only: %i[new create]
  end
  resources :signatories, only: %i[edit update show]
end
