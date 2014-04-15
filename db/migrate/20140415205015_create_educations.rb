class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.text :school_name
      t.text :field_of_study
      t.date :start_date
      t.date :end_date
      t.text :degree
      t.text :activities
      t.text :notes
      t.integer :full_profile_id

      t.timestamps
    end
  end
end
