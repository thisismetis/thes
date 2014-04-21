class Proficiency < ActiveRecord::Base
  belongs_to :talent_profile
  belongs_to :skill

  validates :level, presence: true, on: :update
end
