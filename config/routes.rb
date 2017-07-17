Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "links#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy", as: 'logout'

  get "/signup", to: "users#new", as: 'signup'
  post "/create", to: "users#create", as: 'create_user'

end
