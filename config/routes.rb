Thes::Application.routes.draw do
  root 'homes#show'

  resources 'talents', only: [:show, :create] do
    resource 'proficiencies', only: [:edit, :update]
  end

  resources 'companies', only: [:show, :create]
  resources 'users', only: [:new]
  resource 'linkedin', only: [:create]
end
