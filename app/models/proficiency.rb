class Proficiency < ActiveRecord::Base
  belongs_to :talent_profile
  belongs_to :skill

  def level_name
    if level == 1
      "beginner"
    elsif level == 2
      "intermediate"
    elsif level == 3
      "advanced"
    end
  end
end
