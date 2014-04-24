class Talent < User
  has_one :profile, class_name: "TalentProfile", dependent: :destroy
  accepts_nested_attributes_for :profile
  validates_associated :profile

  def linkedin_url
    "https://www.linkedin.com/profile/view?id=#{profile.linkedin_id}"
  end
end
