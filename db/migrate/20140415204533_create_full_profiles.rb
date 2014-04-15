class CreateFullProfiles < ActiveRecord::Migration
  def change
    create_table :full_profiles do |t|
      t.text :associations
      t.text :honors
      t.text :interests
      t.integer :user_id

      t.timestamps
    end
  end
end
