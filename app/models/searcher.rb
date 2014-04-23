class Searcher
  def initialize(search_params)
    @query = search_params[:query]
  end

  def profiles
    TalentProfile.where(id: talent_profile_ids)
  end

  private

  def talent_profile_ids
    skills.map(&:talent_profile_ids).flatten.uniq
  end

  def skills
    Skill.includes(:talent_profiles).where("name ILIKE :query", query: "%#{@query}%")
  end
end
