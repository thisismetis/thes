class TalentProfile < ActiveRecord::Base
  belongs_to :talent
  has_many :proficiencies
  has_many :skills, through: :proficiencies

  accepts_nested_attributes_for :proficiencies
end
