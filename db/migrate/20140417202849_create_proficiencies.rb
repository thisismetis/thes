class CreateProficiencies < ActiveRecord::Migration
  def change
    create_table :proficiencies do |t|
      t.belongs_to :talent_profile, index: true
      t.belongs_to :skill, index: true

      t.timestamps
    end
  end
end
