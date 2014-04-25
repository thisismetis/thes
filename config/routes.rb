Thes::Application.routes.draw do
  root 'homes#show'

  resources 'talents', only: [:show, :create]
  resource 'proficiency_list', only: [:edit, :update]

  resources 'companies', only: [:show, :create]
  resources 'users', only: [:new]
  resource 'linkedin', only: [:create]

  resource 'search', only: [:show, :new]
  resource 'search_form_inputs', only: [:show]

  get 'oauth_return' => 'oauth_sessions#create'
  resource 'oauth_session', only: [:destroy]
  resource 'guest', only: [:show]
end
