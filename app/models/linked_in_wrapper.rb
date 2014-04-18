class LinkedInWrapper

  LINKEDIN_CONFIG = {
    site: "https://api.linkedin.com",
    authorize_path: "/uas/oauth/authenticate",
    request_token_path: "/uas/oauth/requestToken?scope=r_fullprofile+r_emailaddress+w_messages+r_contactinfo+rw_company_admin",
    access_token_path: "/uas/oauth/accessToken"
  }

  attr_reader :atoken, :asecret

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

  def authorize(rtoken, rsecret, pin)
    @atoken, @asecret = client.authorize_from_request(rtoken, rsecret, pin)
    client.authorize_from_access(atoken, asecret)
    self
  end

  def get_profile
    client.profile(fields: [
      "first-name",
      "last-name",
      "email-address",
      :industry,
      :summary,
      :skills]).
    to_hash
  end

  private
  attr_reader :client

  def oauth_callback_url(request)
    "http://#{request.host}:#{request.port}/users/new"
  end
end
