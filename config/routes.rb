Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # root to: "issues#index"
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  authenticated :user do
    root to: "issues#index", as: :authenticated_root
  end

  resources :issues, only: [ :show, :new, :create, :edit, :update, :destroy ] do
    resources :appointments, only: [ :new, :create ]
  end

  get "profile", to: "users#profile", as: "profile_user"
  resources :users, only: [:show]

  resources :appointments do
    member do
      patch :confirm
      patch :decline
    end
  end 
end
