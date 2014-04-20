class TalentProfileGenerator

  def run(talent, data)
    profile = talent.profile
    profile.first_name = data["first_name"]
    profile.last_name = data["last_name"]
    profile.industry = data["industry"]
    profile.summary  = data["summary"]
    profile.linkedin_id = data["id"]
    profile.picture_url = data["picture_url"]
    talent
  end

end
