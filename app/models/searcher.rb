class Searcher
  def initialize(search_params)
    @skill_names = search_params[:query]
    @levels = search_params[:level]
  end

  def profiles
    skill_names.each.
      inject(TalentProfile) do |relation, (index, skill_name)|
      relation.
        joins(join_sql(index)).
        where(where_sql(index), "%#{skill_name}%", levels[index])
    end
  end

  private

  attr_reader :skill_names, :levels

  def join_sql(index)
    <<-JOIN_SQL
      INNER JOIN proficiencies AS proficiencies_#{index}
        ON proficiencies_#{index}.talent_profile_id = talent_profiles.id
      INNER JOIN skills AS skills_#{index}
        ON skills_#{index}.id = proficiencies_#{index}.skill_id
    JOIN_SQL
  end

  def where_sql(index)
    <<-WHERE_SQL
      skills_#{index}.name ILIKE ?
        AND proficiencies_#{index}.level = ?
    WHERE_SQL
  end
end
