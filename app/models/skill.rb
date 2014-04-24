class Skill < ActiveRecord::Base
  has_many :proficiencies, dependent: :destroy
  has_many :talent_profiles, through: :proficiencies
end
