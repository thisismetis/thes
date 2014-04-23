class Searcher
  def initialize(search_params)
    @query = search_params[:query]
    @level = search_params[:level]
  end

  def profiles
    TalentProfile.where(id: talent_profile_ids)
  end

  private

  def talent_profile_ids
    proficiencies.map(&:talent_profile_id).uniq
  end

  def skills
    Skill.includes(:talent_profiles).where("name ILIKE :query", query: "%#{@query}%")
  end

  def proficiencies
    Proficiency.where(level: @level, skill_id: skills)
  end
end
