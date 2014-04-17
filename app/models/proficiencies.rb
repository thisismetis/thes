class Proficiencies < ActiveRecord::Base
  belongs_to :talent_profile
  belongs_to :skill
end
