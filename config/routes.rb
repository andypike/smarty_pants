Rails.application.routes.draw do
  root "pages#home"

  get :sign_up, :to => "accounts#new"
  get :login,   :to => "sessions#new"

  resources :accounts
  resources :children
  resource :session
end
