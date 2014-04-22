class Skill < ActiveRecord::Base
  has_many :proficiencies
  has_many :talent_profiles, through: :proficiencies
end
