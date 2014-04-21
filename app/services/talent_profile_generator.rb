class TalentProfileGenerator

  def run(talent, data)
    talent.profile = build_profile(data)
    talent
  end

  private

  def build_profile(data)
    TalentProfile.new.tap do |profile|
      profile.first_name = data["first_name"]
      profile.last_name = data["last_name"]
      profile.industry = data["industry"]
      profile.summary  = data["summary"]
      profile.linkedin_id = data["id"]
      profile.picture_url = data["picture_url"]
    end
  end

end
