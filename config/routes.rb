Thes::Application.routes.draw do
  root 'homes#show'

  resources 'talents', only: [:show, :edit, :create, :update]

  resources 'companies', only: [:show, :create]

  resources 'users', only: [:new]
  resource 'linkedin', only: [:create]
end
