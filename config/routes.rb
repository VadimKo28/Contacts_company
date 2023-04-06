Rails.application.routes.draw do
  # get "departaments/index"
  resources :feedbacks

  resources :departaments 
  resources :contacts
  
end
