Rails.application.routes.draw do
  devise_for :users
  # get "departaments/index"
  resources :feedbacks

  resources :departaments 
  resources :contacts
  root to: "departaments#index"
end
