class SessionsController < ApplicationController
  def create
    oauth_session = OauthSession.new(linkedin, params[:oauth_verifier])
    oauth = oauth_session.oauth_creds
    make_session_cookies(oauth)
    redirect_to path_to_redirect_to(oauth.user)
  end

  private

  def oauth
    client = authorize_linkedin_request(params[:oauth_verifier])
    retrieve_oauth || create_oauth
  end

  def retrieve_oauth

  end

  def make_session_cookies(oauth)
    cookies.permanent.signed[:atoken] = oauth.atoken
    cookies.permanent.signed[:asecret] = oauth.asecret
  end

  def path_to_redirect_to(user)
    if user.persisted?
      user
    else
      new_user_path
    end
  end
end
