Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :dashboards, only: :index

  resources :bookings, only: %i[show destroy] do
    resources :reviews, only: %i[new create]
    resources :payments, only: :new
    member do
      get 'accept'
      get 'reject'
    end
  end

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  resources :offices, only: %i[index show] do
    resources :bookings, only: %i[new create]
  end
end
