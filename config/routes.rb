Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resource :registration, only: [:new, :create]
  resources :products do
    resource :comments, only: [:create, :destroy]
  end
  root "products#index"
end
