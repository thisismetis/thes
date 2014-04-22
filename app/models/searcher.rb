class Searcher
  def initialize(search_params)
    @query = search_params[:query]
  end

  def profiles
    skills.map(&:talent_profiles).flatten.uniq
  end

  private

  def skills
    Skill.where("name ILIKE :query", query: "%#{@query}%")
  end
end
