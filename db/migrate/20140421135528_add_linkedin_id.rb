class AddLinkedinId < ActiveRecord::Migration
  def change
    add_column :talent_profiles, :linkedin_id, :integer
    add_column :talent_profiles, :picture_url, :string
  end
end
