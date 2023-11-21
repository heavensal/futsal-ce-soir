Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  resources :events, only: [:index, :show, :new, :create, :update, :destroy ] do
    post 'join_team', to: 'event_players#create_or_update', as: :join_team
  end

  patch 'free_agent', to: 'users#update', as: :free_agent
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
