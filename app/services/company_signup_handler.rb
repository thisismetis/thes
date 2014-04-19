class CompanySignupHandler
  include SignupHandler
  COMPANY = "Company"

  def process
    company_details = client.get_company_profile
    company = make_user(company_details["email_address"], COMPANY)
    make_oauth company
    company_details["industries"] = prepare_industries company_details["industries"]["all"]
    company_details["locations"] = prepare_locations company_details["locations"]["all"]
    profile = make_profile(company, company_details)
    company
  end

  private

  def prepare_locations(locations)
    locations.map { |location| Location.create(postal_code: location["address"]["postal_code"]) }
  end

  def prepare_industries(industries)
    industries.map { |industry| Industry.find_or_create_by(linkedin_id: industry["code"], name: industry["name"]) }
  end

  def make_profile(company, details)
    CompanyProfile.create(
      linkedin_id: details["id"],
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
