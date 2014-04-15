Thes::Application.routes.draw do
  root 'homes#show'

  resources "talents", only: [:show]
end
