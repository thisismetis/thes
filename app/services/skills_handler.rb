class SkillsHandler

  def run(user, data)
    parse_skills data
    skills = generate_skills
    user.profile.skills = skills
    user
  end

  private

  attr_reader :skills

  def parse_skills(data)
    @skills = data["skills"]["all"]
  end

  def generate_skills
    skills.map do |skill|
      Skill.find_or_create_by(name: skill["skill"]["name"])
    end
  end
end
