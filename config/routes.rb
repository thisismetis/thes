Thes::Application.routes.draw do
  devise_for :users
  root 'homes#show'

  resources 'talents', only: [:show]

  resources :linkedin
end
