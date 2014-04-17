class LinkedInWrapper

  LINKEDIN_CONFIG = {
    site: "https://api.linkedin.com",
    authorize_path: "/uas/oauth/authenticate",
    request_token_path: "/uas/oauth/requestToken?scope=r_fullprofile",
    access_token_path: "/uas/oauth/accessToken"
  }

  def initialize
    @client = LinkedIn::Client.new(
      ENV['LINKEDIN_KEY'],
      ENV['LINKEDIN_SECRET'],
      LINKEDIN_CONFIG)
  end

  def request_token(request)
    callback_url = oauth_callback_url request
    client.request_token(oauth_callback: callback_url)
  end

  def authorize_from_request(token, secret, pin)
    client.authorize_from_request(token, secret, pin)
  end

  def authorize_from_access(token, secret)
    client.authorize_from_access(token, secret)
    self
  end

  def get_profile
    client.profile({fields:
      "first-name",
      "last-name",
      :industry,
      :summary,
      :skills).
    to_hash
  end

  private
  attr_reader :client

  def oauth_callback_url(request)
    "http://#{request.host}:#{request.port}/users/new"
  end
end
