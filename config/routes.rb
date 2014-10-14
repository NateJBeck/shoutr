Rails.application.routes.draw do
  resource  :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create] do
    resources :following_relationships, only: [:create]
  end
  resources :shouts, only: [:create, :index]

  root "shouts#index"
end
