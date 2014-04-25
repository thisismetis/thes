class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @user ||= oauth.user
  end

  def signed_in?
    current_user.class < User
  end

  def get_linkedin_request_token
    linkedin.request_token request
  end

  def linkedin_with_user_creds
    linkedin.authorize_from_request(
      session[:rtoken],
      session[:rsecret],
      params[:oauth_verifier])
  end

  def authorize_with_linkedin
    linkedin.authorize_from_access(oauth.atoken, oauth.asecret)
  end

  def linkedin
    LinkedInWrapper.new
  end

  def oauth
    @oauth ||= linkedin_oauth_setting
  end

  def linkedin_oauth_setting
    LinkedinOauthSetting.find_by(
      atoken: atoken,
      asecret: asecret) || NullLinkedinOauthSetting.new
  end

  def atoken
    cookies.signed[:atoken]
  end

  def asecret
    cookies.signed[:asecret]
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def company?
    current_user.type == "Company"
  end

  def talent?
    current_user.type == "Talent"
  end
end
