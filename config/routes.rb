Rails.application.routes.draw do
  devise_for :users
  resources :feedbacks
  resources :departaments 
  resources :contacts
  root to: "departaments#index"
  get "/search", to: "contacts#search"

end
