Rails.application.routes.draw do
  get 'departaments/index'
  resources :feedbacks
  resources :departaments
end
