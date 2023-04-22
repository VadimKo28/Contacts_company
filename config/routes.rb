Rails.application.routes.draw do
  devise_for :users
  resources :feedbacks, except: %i[edit update destroy]
  resources :contacts
  root to: "contacts#index"
  get "/contact_search", to: "contacts#contact_search"
  get "/departament_search", to: "departaments#departament_search"
  get "/departaments", to: "departaments#index"
  get 'export', to: 'contacts#export_to_excel'

end
