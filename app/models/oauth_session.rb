class OauthSession
  def initialize(linkedin_credentials)
    @linkedin_credentials = linkedin_credentials
  end

  def oauth_creds
    retrieve_oauth || make_oauth
  end

  private

  attr_reader :linkedin_credentials

  def make_oauth
    LinkedinOauthSetting.create(
      asecret: asecret,
      atoken: atoken)
  end

  def retrieve_oauth
    LinkedinOauthSetting.where(
      asecret: asecret,
      atoken: atoken).first
  end

  def asecret
    linkedin_credentials[1]
  end

  def atoken
    linkedin_credentials[0]
  end

end
