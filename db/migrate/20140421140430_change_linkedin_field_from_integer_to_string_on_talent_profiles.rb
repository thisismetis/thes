class ChangeLinkedinFieldFromIntegerToStringOnTalentProfiles < ActiveRecord::Migration
  def change
    remove_column :talent_profiles, :linkedin_id
    add_column :talent_profiles, :linkedin_id, :string
  end
end
