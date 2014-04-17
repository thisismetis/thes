class LinkedinsController < ApplicationController
  def create
    request_token = get_linkedin_request_token
    session[:rtoken] = request_token.token
    session[:rsecret] = request_token.secret
    redirect_to request_token.authorize_url
  end
end
