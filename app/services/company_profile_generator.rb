class CompanyProfileGenerator

  def run(company, data)
    company.profile = build_profile(data)
    company
  end

  private

  def build_profile(data)
    CompanyProfile.new.tap do |profile|
      profile.linkedin_id = data["id"]
      profile.name = data["name"]
      profile.logo_url = data["logo_url"]
      profile.description = data["description"]
      profile.employee_count_range = data["employee_count_range"]["name"]
    end
  end
end
