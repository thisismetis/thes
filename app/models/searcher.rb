class Searcher
  def initialize(search_params)
    @skill_names = search_params[:query]
    @levels = search_params[:level]
  end

  def profiles
    skill_names.each.inject(TalentProfile) do |relation, (index, skill_name)|
      relation.joins(<<-JOIN_SQL).where(<<-WHERE_SQL, "%#{skill_name}%", levels[index])
        INNER JOIN proficiencies AS proficiencies_#{index}
          ON proficiencies_#{index}.talent_profile_id = talent_profiles.id
        INNER JOIN skills AS skills_#{index}
          ON skills_#{index}.id = proficiencies_#{index}.skill_id
      JOIN_SQL
        skills_#{index}.name ILIKE ?
          AND proficiencies_#{index}.level = ?
      WHERE_SQL
    end
  end

  private

  attr_reader :skill_names, :levels
end
