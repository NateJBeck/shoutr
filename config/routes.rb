Rails.application.routes.draw do
  resource  :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :index] do
    resource :following_relationship, only: [:create, :destroy]
  end
  
  resource :search, only: [:show]
  resources :followers, only: [:index]
  resources :image_subjects, only: [:create]
  resources :text_subjects, only: [:create]
  resources :shouts, only: [:index]

  get "/:username", to: "users#show", as: :user

  root "shouts#index"
end
