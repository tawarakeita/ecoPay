Rails.application.routes.draw do
  root 'top#index'

  resources :missions do
    collection do
      match 'complete', to: 'missions#complete_via_url', via: [:get, :post], as: :complete_via_url
      post 'finalize_complete', to: 'missions#finalize_complete', as: :finalize_complete
    end
  end

  resources :payments

  resources :point_transactions

  get "scanqrcode", to: "scanqrcode#new"

  get "merchant_search", to: "merchant_search#index"

  resource :user, only: [:show]

  devise_for :merchants, controllers: {
    registrations: 'merchants/registrations'
  }

  devise_for :users

  devise_for :mission_admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
