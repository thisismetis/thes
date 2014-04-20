class Talent < User
  has_one :profile, class_name: "TalentProfile"

  def skills
    profile.skills
  end

  def skills=(values)
    profile.skills = values
  end
end
