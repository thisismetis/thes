class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :postal_code
      t.belongs_to :user, polymorphic: true

      t.timestamps
    end
  end
end
