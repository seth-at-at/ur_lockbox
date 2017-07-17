Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "links#index"
  get "/login", to: "sessions#new", as: 'login_signup'
  post "/create", to: "sessions#create", as: 'create_user'
end
