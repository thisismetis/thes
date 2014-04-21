class IndustriesHandler
  def run(user, data)
    parse_industries data
    industries = generate_industries
    user.profile.industries = industries
    user
  end

  private

  attr_reader :industries

  def parse_industries(data)
    @industries = data["industries"]["all"]
  end

  def generate_industries
    industries.map do |industry|
      Industry.find_or_create_by(
        linkedin_id: industry["code"],
        name: industry["name"])
    end
  end
end
