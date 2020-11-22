Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :pots, except: [:destroy] do
    resources :gifts, only: [:new, :create, :destroy]
    member do
      post 'gifts/:gift_id/upvote', to: 'gifts#upvote', as: 'upvote'
      post 'gifts/:gift_id/downvote', to: 'gifts#downvote', as: 'downvote'
    end
    resources :contributions, only: [:new, :create]
  end
  resources :gifts, only: [:edit, :update]

  resources :contributions, only: [:show]

  get '/dashboard', to: 'pages#dashboard'
end
