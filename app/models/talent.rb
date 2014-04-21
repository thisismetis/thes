class Talent < User
  has_one :profile, class_name: "TalentProfile"
end
