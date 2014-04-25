class Searcher
  def initialize(search_params)
    @skill_names = search_params[:query]
    @levels = search_params[:level]
  end

  def profiles
    TalentProfile.where(id: talent_profile_ids)
  end

  private

  attr_reader :skill_names, :levels, :proficiencies

  def talent_profile_ids
    ids = proficiencies.map(&:talent_profile_id)
    ids.select { |id| ids.count(id) == skill_names.count }
    ids.uniq
  end

  def proficiencies
    @proficiencies ||= Proficiency.joins(:skill).where(where_clause)
  end

  def where_clause
    wheres.join(" OR ")
  end

  def wheres
    wheres = []
    skill_names.each do |index, skill_name|
      unless skill_name.empty? || levels[index].nil?
        wheres << build_where(skill_name, levels[index])
      end
    end
    wheres
  end

  def build_where(skill_name, level)
    "(#{skill_where(skill_name)} AND #{level_where(level)})"
  end

  def skill_where(skill_name)
    skill_name = sanitize("%#{skill_name}%")
    "skills.name ILIKE #{skill_name}"
  end

  def level_where(level)
    level = sanitize(level)
    "proficiencies.level = #{level}"
  end

  def sanitize(term)
    ActiveRecord::Base.sanitize(term.to_s)
  end
end
