Rails.application.routes.draw do
  root "pages#home"

  get :sign_up, :to => "accounts#new"

  resources :accounts
end
