Rails.application.routes.draw do
  get 'votes/index'
  get 'votes/show'
  get 'votes/new'
  get 'votes/edit'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  get 'works/index'
  get 'works/show'
  get 'works/new'
  get 'works/edit'

  resources :works
  resources :users
  resources :votes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
