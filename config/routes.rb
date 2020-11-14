Rails.application.routes.draw do
  post '/works/:work_id/upvote', to: 'votes#upvote', as: 'upvote'
  root to: 'works#homepage'
  resources :users, only: [:show, :index]

  get "/users/current", to: "users#current", as: "current"

  get "/login", to: "users#login_form", as: "login"
  post "/login", to: "users#login"
  post "/logout", to: "users#logout", as: "logout"


  resources :works


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
