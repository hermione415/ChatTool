Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit, :update, :show]
  resources :posts, only: [:show, :new, :create]
  resources :events, only: [:show, :new, :create, :edit, :update] do
    member do
      get :confirm
    end
  end
  resources :rooms, only: [:index, :new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end