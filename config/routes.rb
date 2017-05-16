Rails.application.routes.draw do

  resources :auctions, only: [:index, :show, :create, :new] do
    resources :bids, only: [:create, :show]
    resources :favorites, only: [:create, :show, :destroy]
  end

  resources :users, only: [:new, :create] do
    resources :favorites, only: [:index, :destroy]
    resources :bids, only: [:index]
  end

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  root 'welcome#index'
end
