class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.text :title
      t.text :summary
      t.date :start_date
      t.date :end_date
      t.boolean :is_current
      t.text :company
      t.integer :full_profile_id

      t.timestamps
    end
  end
end
