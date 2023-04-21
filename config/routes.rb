Rails.application.routes.draw do
  devise_for :users
  resources :feedbacks
  resources :departaments 
  resources :contacts
  root to: "contacts#index"
  get "/contact_search", to: "contacts#contact_search"
  get "/departament_search", to: "departaments#departament_search"


end
