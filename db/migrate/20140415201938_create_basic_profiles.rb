class CreateBasicProfiles < ActiveRecord::Migration
  def change
    create_table :basic_profiles do |t|
      t.text :first_name
      t.text :last_name
      t.text :maiden_name
      t.text :formatted_name
      t.text :headline
      t.text :location
      t.text :industry
      t.text :summary
      t.text :specialties
      t.text :picture_url
      t.text :public_profile_url
      t.integer :user_id

      t.timestamps
    end
  end
end
