class UsersController < ApplicationController
  def new
    session[:oauth_verifier] = params[:oauth_verifier]
  end
end
