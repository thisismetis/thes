class CompanySignupHandler
  COMPANY = "Company"

  def initialize(client)
    @client = client
  end

  def process
    company_details = client.get_company_profile
    Rails.logger.debug company_details
    company = make_user company_details
    make_oauth company
    company_details["industries"] = prepare_industries company_details["industries"]["all"]
    company_details["locations"] = prepare_locations company_details["locations"]["all"]
    profile = make_profile(company, company_details)
    company
  end

  private

  attr_reader :client

  def prepare_locations(locations)
    locations.map { |location| Location.create(postal_code: location["postal_code"]) }
  end

  def prepare_industries(industries)
    industries.map { |industry| Industry.find_or_create_by(linkedin_id: industry["code"], name: industry["name"]) }
  end

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
    Rails.logger.debug details.inspect
    CompanyProfile.create(
      id: details["id"],
      name: details["name"],
      industries: details["industries"],
      logo_url: details["logo_url"],
      employee_count_range: details["employee_count_range"]["name"],
      locations: details["locations"],
      description: details["description"],
      company: company
    )
  end
end
