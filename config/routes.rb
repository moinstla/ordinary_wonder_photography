Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users

  resources :home, only: [:index]

  resources :photos do
    resources :reviews , except: [:show, :index]
  end
end
