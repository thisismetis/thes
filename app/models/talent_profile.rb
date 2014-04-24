class TalentProfile < ActiveRecord::Base
  belongs_to :talent
  has_many :proficiencies, dependent: :destroy
  has_many :skills, through: :proficiencies

  accepts_nested_attributes_for :proficiencies
  validates_associated :proficiencies

  def name
    "#{first_name} #{last_name}"
  end
end
