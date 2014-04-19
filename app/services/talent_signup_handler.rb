class TalentSignupHandler
  include SignupHandler
  TALENT = "Talent"

  def process
    talent_details = client.get_profile
    talent = make_user(talent_details["email_address"], TALENT)
    make_oauth talent
    profile = make_profile(talent, talent_details)
    store_proficiencies(profile, talent_details["skills"]["all"])
    talent
  end

  private

  def make_profile(talent, details)
    TalentProfile.create(
      first_name: details["first_name"],
      last_name: details["last_name"],
      industry: details["industry"],
      summary: details["summary"],
      talent: talent
    )
  end

  def store_proficiencies(profile, skills)
    profile_skills = get_skills skills
    skill_rows = generate_skill_rows(profile, profile_skills)
    Proficiencies.create skill_rows
  end

  def generate_skill_rows(profile, skills)
    skills.map do |skill|
      { talent_profile: profile, skill: skill }
    end
  end

  def get_skills(skills)
    skills.map do |skill|
      Skill.find_or_create_by(name: skill["skill"]["name"])
    end
  end
end
