class CompanySignupHandler
  COMPANY = "Company"

  def initialize(client)
    @client = client
  end

  def process
    company_details = client.get_profile
    company = make_user company_details
    make_oauth company
    profile = make_profile(company, company_details)
    company
  end

  private

  attr_reader :client

  def make_user(details)
    User.create(email: details["email_address"], type: COMPANY)
  end

  def make_oauth(company)
    LinkedinOauthSetting.create(
      atoken: client.atoken,
      asecret: client.asecret,
      user: company)
  end

  def make_profile(company, details)
    CompanyProfile.create(
      id: details["id"],
      name: details["name"],
      industries: details["industries"],
      logo_url: details["logo_url"],
      employee_count_range: details["employee_count_range"],
      locations: details["locations"],
      description: details["description"],
      company: company
    )
  end
end
