class Talent < User
  has_one :profile, class_name: "TalentProfile", dependent: :destroy
  accepts_nested_attributes_for :profile
  validates_associated :profile
end
