class OauthSessionsController < ApplicationController
  def create
    oauth = oauth_session.oauth_creds
    make_session_cookies(oauth)
    redirect_to path_for_user(oauth.user)
  end

  private

  def oauth_session
    OauthSession.new(linkedin_with_user_creds)
  end

  def make_session_cookies(oauth)
    cookies.permanent.signed[:atoken] = oauth.atoken
    cookies.permanent.signed[:asecret] = oauth.asecret
  end

  def path_for_user(user)
    if user.persisted?
      user
    else
      new_user_path
    end
  end
end
