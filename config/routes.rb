Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :registration, only: [:new, :create]
  resources :products do
    resources :comments, only: [:create, :destroy]
  end
  root "products#index"
end
