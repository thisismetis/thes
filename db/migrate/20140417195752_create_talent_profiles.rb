class CreateTalentProfiles < ActiveRecord::Migration
  def change
    create_table :talent_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :industry
      t.text :summary
      t.belongs_to :talent, index: true

      t.timestamps
    end
  end
end
