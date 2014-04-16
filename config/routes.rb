Thes::Application.routes.draw do
  devise_for :users

  root :to => 'homes#show'

  resources 'talents', only: [:show]

  resources :linkedin
  get 'linkedin_profile' => 'linkedin#linkedin_profile'
  get 'oauth_account' => 'linkedin#oauth_account'
  get 'linkedin_oauth_url' => 'linkedin#generate_linkedin_oauth_url'
end
