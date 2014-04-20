class LinkedInWrapper

  LINKEDIN_CONFIG = {
    site: "https://api.linkedin.com",
    authorize_path: "/uas/oauth/authenticate",
    request_token_path: "/uas/oauth/requestToken?scope=r_fullprofile+r_emailaddress+w_messages+r_contactinfo+rw_company_admin",
    access_token_path: "/uas/oauth/accessToken"
  }

  attr_reader :atoken, :asecret

  def initialize
    @client = ThesLinkedInClient.new(
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

  def get_talent_profile(fields)
    client.profile(fields).to_hash
  end

  def get_company_profile
    companies = client.companies.to_hash
    company_id = companies["all"].first["id"]
    details = client.company_profile(fields: {
      id: company_id,
      all: [
        :id,
        :name,
        "logo-url",
        "employee-count-range",
        :locations,
        :industries,
        :description]
    }).
    to_hash
    profile = client.profile(fields: ["email-address"]).to_hash
    details["email_address"] = profile["email_address"]
    details
  end

  private
  attr_reader :client

  def oauth_callback_url(request)
    "http://#{request.host}:#{request.port}/users/new"
  end
end
