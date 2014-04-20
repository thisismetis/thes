class SkillHandler

  def run(user, data)
    parse_skills data
    skills = generate_skills
    user.skills = skills
  end

  private

  attr_reader :skills

  parse_skills(data)
  end

  def generate_skills
    skills.map do |skill|
      Skill.find_or_create_by(name: skill["skill"]["name"])
    end
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
