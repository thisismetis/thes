class AddLinkedinUrlFieldToProfiles < ActiveRecord::Migration
  def change
    add_column :talent_profiles, :linkedin_url, :string
    add_column :company_profiles, :linkedin_url, :string
    remove_column :talent_profiles, :linkedin_id
    remove_column :company_profiles, :linkedin_id
  end
end
