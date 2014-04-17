class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def get_linkedin_request_token
    linkedin.request_token request
  end

  def authorize_with_linkedin
    linkedin.authorize_from_request(
      session[:rtoken],
      session[:rsecret],
      session[:oauth_verifier])
  end

  def linkedin
    LinkedInWrapper.new
  end
end
